package com.oceanview.singleton;

import java.io.FileWriter;
import java.io.IOException;

public class FileManager {

    private static FileManager instance;

    private FileManager(){}

    public static FileManager getInstance(){
        if(instance == null){
            instance = new FileManager();
        }
        return instance;
    }

    public void write(String path, String data) throws IOException {
        FileWriter fw = new FileWriter(path, true);
        fw.write(data + "\n");
        fw.close();
    }
}