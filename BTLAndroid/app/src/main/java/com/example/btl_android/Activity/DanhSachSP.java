package com.example.btl_android.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.btl_android.R;
import com.example.btl_android.Model.DienThoai;
import com.example.btl_android.Util.DienthoaiAdapter;
import com.example.btl_android.Util.Server;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class DanhSachSP extends AppCompatActivity {
    ImageView trove;
    TextView chitiet;
    ListView listView;
    public static ArrayList<DienThoai> dienthoaiArrayList = new ArrayList<>();
    DienthoaiAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_danhsach);
        listView = findViewById(R.id.mylistview_Danhsachsp);

        adapter= new DienthoaiAdapter(this,dienthoaiArrayList);
        listView.setAdapter(adapter);
        getdata();

        trove = (ImageView) findViewById(R.id.IV_BackToHome);
        trove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent = new Intent(getApplicationContext(), TrangChu.class);
                intent.putExtra("email_user", TrangChu.email_user);
                startActivity(intent);
            }
        });

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                finish();
//                Toast.makeText(getApplicationContext(), "" + dienthoaiArrayList.get(i).getIdproduct(), Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(getApplicationContext(),ChiTietSanPham.class);
                int idpro = dienthoaiArrayList.get(i).getIdproduct();
                intent.putExtra("idproduct", dienthoaiArrayList.get(i).getIdproduct());
                startActivity(intent);
            }
        });
    }
    public  void getdata()
    {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest stringRequest = new StringRequest(Request.Method.GET, Server.getAllProduct, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                dienthoaiArrayList.clear();
                try {
                    JSONArray jsonArray = new JSONArray(response);

                    for (int i=0;i<jsonArray.length();i++){
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        int idproduct = jsonObject.getInt("idproduct");
                        String nameproduct = jsonObject.getString("nameproduct");
                        int price  =  jsonObject.getInt("price");

                        String manhinh = jsonObject.getString("manhinh");
                        String hdh = jsonObject.getString("hdh");
                        String camerasau = jsonObject.getString("camerasau");
                        String cameratruoc = jsonObject.getString("cameratruoc");
                        String chip = jsonObject.getString("chip");
                        String ram = jsonObject.getString("ram");
                        String bnt = jsonObject.getString("bnt");
                        String sim = jsonObject.getString("sim");
                        String pinsac = jsonObject.getString("pinsac");
                        int sum = jsonObject.getInt("sum");
                        int idtype = jsonObject.getInt("idtype");
                        String hinh = jsonObject.getString("hinh");
                        DienThoai dt= new DienThoai(idproduct,nameproduct,price,manhinh,hdh, camerasau, cameratruoc, chip, ram, bnt, sim, pinsac,sum,idtype, hinh);
                        dienthoaiArrayList.add(dt);
                    //    Toast.makeText(getApplicationContext(), "" + dienthoaiArrayList.size(), Toast.LENGTH_SHORT).show();
                        adapter.notifyDataSetChanged();
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), "Lỗi " + error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        requestQueue.add(stringRequest);
    }
    @Override
    public void onBackPressed() {
        finish();
        startActivity(new Intent(getApplicationContext(),TrangChu.class));
    }
}

