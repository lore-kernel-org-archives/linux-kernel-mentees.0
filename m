Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F33C19F2C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Jul 2022 23:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2F9A83168;
	Sat, 30 Jul 2022 23:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F9A83168
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AAAp2ws1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KVFBdoXlhOz; Sat, 30 Jul 2022 23:19:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C1C4E82F4F;
	Sat, 30 Jul 2022 23:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1C4E82F4F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E073C0033;
	Sat, 30 Jul 2022 23:19:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1683C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 23:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6942560B4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 23:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6942560B4E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AAAp2ws1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akAugUTjiAss
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 23:19:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0859060AD4
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0859060AD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 23:19:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l22so9907815wrz.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 16:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VDb1fygqmzJq+4ODXnKnnrG1zJ5IMlTZW7OoKxaS5S8=;
 b=AAAp2ws1QCgGbsgAWKfpIVhIIiXOqVKRilbalzriAoKHYqU6axRIpnpCWNf13hrOgj
 TmEUelGjHTR2uDN+mBV8Ie9ZiJdtcvXk6YorOCQ7ErIDUlV2SgO568APKK5hqWA2Xu2n
 pnMb5xvDQwlBLOfQmlM+CqfpdAhbCa/KFf8IutLQ6EUte03tiwbhuhdN7p8gTSF6qo+f
 ndlKsKWfFwcmYSnaz+Q+GXohciBMPQEFAsepA99KwNfQ4WN8RS0izvP29FRo4C8tIv43
 c1toi0rKgwU7fZaC7b1of8YcCEFZmLg1BzKh7tBjQY4JAyaEXJmnT68qykkp/zZjJSal
 KRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VDb1fygqmzJq+4ODXnKnnrG1zJ5IMlTZW7OoKxaS5S8=;
 b=GLzc5sYJY51cQgKFCI7QIAT0pvOvcGmor3rdih7nufdBOSiWkIdRAialoWDAIf1C3K
 V8YsKoTcFvUIL6o4E732lHWBnO7oROdDYAUyHHDC2vw2mZVCnOZCrqj5/5LLLfRNjE/T
 Pz1zhCdvrhP3iOdswTiIgyk9rPN9N57lKTSSxSDTFZRe/Fw5CXgtUtG0yMSKmYJp7qV6
 OZL7jSgyeilvzIHPXQNDNwf8ZhTsCoFuFfl35aSRrrYSgNRy4+UK0l8yGy3UhF2cy8yZ
 kYazErv89N90WjqmGUg1D4ZTtgEpYrTGnLh1QMv56Q13oed9GcN1JLAfwnLfarBd0Ez8
 44Zw==
X-Gm-Message-State: ACgBeo3+hvlzR3fRLgQbjf5DyxhRa3KLSmpqFzx98DgD45LhEG6l9rEM
 moYTGClwpgWcq1aH7mQ7Dfk=
X-Google-Smtp-Source: AA6agR7uhwIFSGLZ+KbnvPVkvqnl4EdyZiLqBn7R765VXBBW+icHEpU0Hfv/9FmS9nxO1FaZrGhQrg==
X-Received: by 2002:a5d:55d1:0:b0:21e:cc2c:f357 with SMTP id
 i17-20020a5d55d1000000b0021ecc2cf357mr5946574wrw.186.1659223171912; 
 Sat, 30 Jul 2022 16:19:31 -0700 (PDT)
Received: from localhost.localdomain ([84.255.184.16])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a7bcb55000000b003a3270735besm9375351wmj.28.2022.07.30.16.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 16:19:31 -0700 (PDT)
From: Mazin Al Haddad <mazinalhaddad05@gmail.com>
To: mripard@kernel.org
Subject: [RFC PATCH] drm/gem: Fix a UAF caused by invalid reference counting
 in drm_gem_mmap()
Date: Sun, 31 Jul 2022 02:15:59 +0300
Message-Id: <20220730231559.85423-1-mazinalhaddad05@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com, tzimmermann@suse.de,
 airlied@linux.ie, paskripkin@gmail.com, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Mazin Al Haddad <mazinalhaddad05@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Fixes a bug reported by syzkaller.

Mmaping a dumb buffer can result in a use-after-free if there is an
error in the return path of the driver specific gem object's mmap()
callback. This is due to improper reference counting in the error path.

The use-after-free occurs when attempting to close the drm file as
the freed gem object is accessed again (through handle). A failure in
drm_gem_shmem_get_pages() within drm_gem_shmem_mmap() (or equivalent
obj->funcs->mmap() call) leads to a call to drm_gem_vm_close()
in the error path, which decrements the reference count of the object
in question and leads to a free after it is further decremented in
drm_gem_mmap_object()'s error path and drm_gem_mmap().

Fix it by removing the call to drm_gem_vm_close() in error path of
driver specific callback. This changes the code so that only two decrements
happen instead of three, matching up with the references taken by the
driver within the drm_gem_mmap() function.

Trimmed syzbot report:

Call Trace:
 <TASK>
 drm_gem_object_release_handle+0xf2/0x110 drivers/gpu/drm/drm_gem.c:253
 idr_for_each+0x113/0x220 lib/idr.c:208
 drm_gem_release+0x22/0x30 drivers/gpu/drm/drm_gem.c:932
 drm_file_free.part.0+0x805/0xb80 drivers/gpu/drm/drm_file.c:281
 drm_file_free drivers/gpu/drm/drm_file.c:248 [inline]
 drm_close_helper.isra.0+0x17d/0x1f0 drivers/gpu/drm/drm_file.c:308
 drm_release+0x1e6/0x530 drivers/gpu/drm/drm_file.c:495

Freed by task 3606:
 kfree+0xd6/0x4d0 mm/slub.c:4584
 drm_gem_object_free drivers/gpu/drm/drm_gem.c:974 [inline]
 kref_put include/linux/kref.h:65 [inline]
 __drm_gem_object_put include/drm/drm_gem.h:371 [inline]
 drm_gem_object_put include/drm/drm_gem.h:384 [inline]
 drm_gem_mmap+0x4fc/0x770 drivers/gpu/drm/drm_gem.c:1134
 call_mmap include/linux/fs.h:2063 [inline]
 mmap_region+0xbe7/0x1460 mm/mmap.c:1796
 do_mmap+0x863/0xfa0 mm/mmap.c:1587
 vm_mmap_pgoff+0x1b7/0x290 mm/util.c:552
 ksys_mmap_pgoff+0x40d/0x5a0 mm/mmap.c:1633

Link: https://syzkaller.appspot.com/bug?id=e84227937d2d71da66e62f8c67b69a0cc387123c
Fixes: 45d9c8dde4cd ("drm/vgem: use shmem helpers")
Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
---

RFC because I'm not quite sure that this is the correct fix so guidance would be
appreciated. I looked at the implementation of the drm_gem_object's
mmap callback in various drivers including, exynos, panfrost and the
cma helper and all of them also call drm_gem_vm_close() on error
(which only decrements the object reference count).

Most likely other drivers also run into this issue on mmap() error,
as the dumb buffer create can have one reference on entry
to drm_gem_mmap(). Two references will then be taken (one in drm_gem_mmap
and the other in drm_gem_mmap_object). If the driver decides to error out
and release a reference within it's own error path it will ultimately
remove three references. So maybe it's easier to have the reference counts
be adjusted in the drm_gem_mmap() and drm_gem_mmap_object() function rather
than have it in the drivers.

Is there a need to go through the other drivers and remove the
drm_gem_vm_close() call? Or is there a better way of doing this.
I'm not sure if deleting the call is the correct thing to do here and if
there is something I'm missing. Please let me know if there is anything
I need to change.


 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ad0e02991ca..01908bba5970 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -622,7 +622,6 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret) {
-		drm_gem_vm_close(vma);
 		return ret;
 	}
 
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
