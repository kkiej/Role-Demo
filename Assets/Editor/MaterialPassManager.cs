using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

[System.Serializable]
public class MaterialPass
{
    public Material material;
    public List<bool> passEnabled;
}

public class MaterialPassManager : MonoBehaviour
{
    public List<MaterialPass> materials = new List<MaterialPass>();

    public void ApplyPassSettings()
    {
        foreach (var matPass in materials)
        {
            if (matPass.material != null)
            {
                for (int i = 0; i < matPass.passEnabled.Count; i++)
                {
                    if (matPass.passEnabled[i])
                    {
                        matPass.material.SetShaderPassEnabled(matPass.material.GetPassName(i), false);
                    }
                    else
                    {
                        matPass.material.SetShaderPassEnabled(matPass.material.GetPassName(i), true);
                    }
                }
            }
        }
    }
}