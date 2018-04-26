using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeToggle : MonoBehaviour
{
    private MeshRenderer mesh;
    private bool isClick = false;


    private void Awake()
    {
        mesh = GetComponent<MeshRenderer>();
        isClick = mesh.sharedMaterial.GetFloat("_Toggle") == 1;
    }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            isClick = !isClick;
            mesh.sharedMaterial.SetFloat("_Toggle", isClick ? 1 : 0);
        }
    }
}
