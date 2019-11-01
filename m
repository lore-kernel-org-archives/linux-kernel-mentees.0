From: Alexander.Deucher at amd.com (Deucher, Alexander)
Date: Fri, 1 Nov 2019 18:18:56 +0000
Subject: [Linux-kernel-mentees] [PATCH] drivers: gpu: drm: amd: amdgpu:
 Add @level to amdgpu_vm_bo_param documentation
In-Reply-To: <20191101163856.GA13800@localhost.localdomain>
References: <20191101163856.GA13800@localhost.localdomain>
Message-ID: <BN6SPR00MB1824AA701FC65A47786A30CF7620@BN6SPR00MB182.namprd12.prod.outlook.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Thanks for the patch.  This has already been fixed.

Alex

________________________________
From: Jaskaran Singh <jaskaransingh7654321 at gmail.com>
Sent: Friday, November 1, 2019 12:38 PM
To: linux-kernel at vger.kernel.org <linux-kernel at vger.kernel.org>
Cc: linux-kernel-mentees at lists.linuxfoundation.org <linux-kernel-mentees at lists.linuxfoundation.org>; Deucher, Alexander <Alexander.Deucher at amd.com>; Koenig, Christian <Christian.Koenig at amd.com>; Zhou, David(ChunMing) <David1.Zhou at amd.com>; airlied at linux.ie <airlied at linux.ie>; daniel at ffwll.ch <daniel at ffwll.ch>; Kuehling, Felix <Felix.Kuehling at amd.com>; Huang, Ray <Ray.Huang at amd.com>
Subject: [PATCH] drivers: gpu: drm: amd: amdgpu: Add @level to amdgpu_vm_bo_param documentation

The documentation for this function is missing the function parameter
"level", so add it. This fixes the following warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:821:
        warning: Function parameter or member 'level'
        not described in 'amdgpu_vm_bo_param'

Signed-off-by: Jaskaran Singh <jaskaransingh7654321 at gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 5251352f5922..6f6a9be11d84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -813,6 +813,7 @@ static int amdgpu_vm_clear_bo(struct amdgpu_device *adev,
  *
  * @adev: amdgpu_device pointer
  * @vm: requesting vm
+ * @level: VMPT level
  * @bp: resulting BO allocation parameters
  */
 static void amdgpu_vm_bo_param(struct amdgpu_device *adev, struct amdgpu_vm *vm,
--
2.21.0

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20191101/f71538de/attachment.html>
