Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23BB34A76B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723566; cv=none; b=VSkq6iGmftULGdU1SRcHqwXiKfywb/NL4vnyajpegTcvMv0dAa+bFx0phxsJ14v9gujgJNkedzFE70+plTrZdEGOkTNjbP+A2VchSUGmobMlSbY4gKOKngQKol5RpgQQlCz5M1ffe9fmvmLS3sEiF8dkcCienE8AVK8NE5gQ7hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723566; c=relaxed/simple;
	bh=lmfpeU/qOommxskIdff42GSurH/4Mpn+oqpN3543UX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eGhIy51kGQH3wAPDeouCt38a32KR3ST1WCoBxShrZCmH8+3itIWo7CN7EEFAgjc+8K1rgE/1KAw43hc+zrdDU5l06c4zePlT4YWqX/zju4OmUGfnrlMs242dnc/RgzlFIR17L/117w+10LO88e/7nrKuiDAw1J1Dfb09a3/PNGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=MdECZyfM; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="MdECZyfM"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EEB960B25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 11:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1Wsya9xTnhY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Nov 2025 11:12:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=98.137.64.147; helo=sonic301-21.consmr.mail.gq1.yahoo.com; envelope-from=adelodunolaoluwa@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4801960AF5
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4801960AF5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=MdECZyfM
Received: from sonic301-21.consmr.mail.gq1.yahoo.com (sonic301-21.consmr.mail.gq1.yahoo.com [98.137.64.147])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4801960AF5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763723562; bh=5vw879DW1bY94s+RsAE4d9X6nU6AgxwMF4w9WAzKT6g=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=MdECZyfMPeTYuYstRYAOcd4zXiJx2qARQ1M2cb9yvvqls/H6ImyUSKHFpSsHNodiPHC2bneSex+QMpDCaQ94nrwMCYlFIpOdotM/fCxuJV46E+eBmnuI9ZG6AM6tEIGi/AEBCMqck3EIb4Jd4YQBOMtOR/P3kwzQlc9E8tRgvp8G1w0X964/2mzMpEYVR4+MOD+lbHqzn322dMP3a9P36nkYMXnWSjnAcRaJOYimB4myQIC+pYnmm38pQpT6BqXB8n1m3Y3n0EWuDxXvdOA4Xw4cZnQBIHV5xDDmzCFh93MWLcI8HL81KqxEs5eWzTCE1UDeegwmt7vtdMdD/ff+hw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763723562; bh=VsjkSZAQftZffDEw46VlW3+4jH0gdxt1ML4f1oP6LhK=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=XqDeyr34xCiupO+8lwrK1cKtEgDvHeOhH7YWp4bJ16w4xNc4mqevGO91N1pkkXEiLUoCr5qZkpRLmQtwCX1LOuWUvpTqNwkwUIUms32WNjbzYxtVWBt50PtWvtFPcLgqcylPLGMLDgZEsvF8F1bMkHYC5ObtfDB2FuTbGqq6xu6wbpg2DvtyiDiVWCXfTSq+Es8Id/G+VJNElP0tLt1O1HY5cQ0QT6uhWoF2Z0NGjxmmtx7TXkbSmx7s8KXVBNPyN/kISiYhSu96yOvXrhBpCPOwnRiCwF/tE6K7JCMcUf1AyHamKLvd6Xmc4GrPjD1aMSH1aIuSCH1Uv8AzxrPZtQ==
X-YMail-OSG: 41SxUloVM1lTCyvhdT5n5XSa_2Bvd2TS7xqBnTJgMq27gmWlQwRS9blLkDfiovc
 nrJ5xkPFZ_laLbD_dt.I.lBtUzjDy6cyCZra6Z87NrEyTtNn8EKHACw4VX8DDo98s4MJh0i7VQLQ
 qoaWvYd0OOerkFev2ip1QCqcoLhZzAGcfJLu2Vmh.HUGpLlT5QYh5xNmW_o2GzjztV5xnpAMEnPh
 iDGPeWH32qOBSkC40_JH7S2nZTn2FENgQIre3S5se.5ZgOnXl2sY9i9BkaWZme1yaf.H_QUplt44
 ab2viV77mCxhvwYDNhoPs3I2H3chXhok8pWUeqBn0GjoH1tPmthq917SO.kZJujmhD.W_zcQy2qR
 FSUR4.1Uj2_iEdRe7EVZ5WMWsNXDv8bw._6kGJg6IBQRFb9fb4eTwSb62X2V8E5_5oIpH_.TfBti
 FZ63oFbp_qA6kSiSiiBquJcSoM3SPtIqecAiz1KYH8195YivxOWinhbSETjNSkWBNHzYvoKUqU2f
 rT1HRhinV5o231wS7VRDx790_EFyJ3_GzDaKwiL1YvEKZ7fgiAMUYo2iVGjkGdPhaABDZnTidGEh
 YjKmql8elC52aU1psbMilcFk7ziqea_8iiU7BGJvFEycKQaKuzEYPjAU_OSIJv776UM_heZQPhHv
 hR3DOIemBQu30nSw6ngVCKIHzNS0Xt6h3QW3LKmPOXInm2mRNy1gq_kHK9Mj1RDoGTLgde7glnXu
 sL07yUbe_kYKF43k_DE.PzhdaTNb5XEqUx1u8Vk8o4m9TVkjB2Fbnzp5H97fFso4utwFdrGD3nSv
 OnSyMx76.Iba3LeUcmyqzm2FNxvpXpJO0zAqVn8I_t80u3x9N9_Hd7DkG0ZkmyenPHsG9oNCPiyo
 ZvCvCej6EkUBD2aUKLhO9b8rEySVlcJ5RGPc6AL6MNI5VqNfXLmeLfDRzPVbHRyFwEHqVIqsFvep
 iQ.gOgQirXmmjn_.WfNjjBCtXShuotUusRVuTIdIHBwpNdewoK.k3C2KCL1r2sqyYB.L60hplDti
 OdPL6fftf2VLj0KE5IXsRSZUiKq.ZodSsqHrLDqQT.2eE4dDouS5Zub5RQFrM5nBzz1hLmxzK5W5
 ZEgK7heL_qHu1x5nlQq9Dvx_1l1H7Nq2SWSAZIA_DNn.ZqO5bX3kw3Pk2X1E7iNpNjdWir4Fv2hP
 ZqBComIouXUdGA3ZStbR7kAi5.UKSu.BRc0vXxwAmh0H24WVdEvAZpZLg6dheax01E.nCbwNa1VO
 7yxCQcJmkG7ddNLn2bWcluXvI.CcdktuwI.9U9rly64s.9Qr3SnC3P7hu2D0KTFuEAQw7aDwly6_
 a4wSC.jnAKX1oNPWuVkfE.mvMh_RxusRr7noKt6TkNiYWV9LHPy7u9wvKUCxtJ8sEWvfInXz.Gre
 vjlchVmMnbVsw90bxPxkvMWFku3ZOE32uIAFigO19u6jBfpOvtgyUZ3kZN4kudh3j5SJDc8CLusd
 9dLjY1vHPxO0uf3iVLi0Lb1GwZQib7Lwy2STl4YnPbomxl4BAoFLwtCDSEs.MU8PMcK.iSG981s4
 Zc5wRHdQ2q8buacQyVjfmJzkn.qBmI6xiPgtCleUNE7KBMslgmfKTQ5WP9eiePFTqdsdxF76NHsd
 3O_BEViiThPmXlTvQjhACtPpqFJC.9Scs5hCBqD0JFRzcLXgEM3NTq9dtEeJ8bxxUnewqfGVh3Lk
 WKL4M09aEjnF4jRLAc.4JLw6MLUTWD2sUCzwtISI9Z.mh.j.PYMlXfCfQB2NtzF0SOMTRgPtPJzS
 411AxAC9Z.uUsjQgw1IWnIKv1KZgo2kv1uoRARCQCHLiAApquccTXgtyO6vOK2zioQEqJeGbwXsR
 zSvRCW5Ch0sz7M0HdNP8EzAahj4BFRiIgPneHYR3JpeQuAwihbrzy.muqzxdKRgGt1rtXEJ__C2v
 FHbnS8oIgt.eM4HIdgc9djR2wE_IBvZqYzfRqyvGs5d96wejIwrn1Pe_uTqjeQScHCV9DXnF4aKQ
 FWqVNv3UnLMuR3WEQKtgrkp4wm_IMwQqHJ2ZnZBGG4YPJFVHK_x.hJNb3CAARKo6YvRVCEPhDZ26
 Zcj1.t8Kib0JGYndMuGZRBXg6Jxab_bPASsp0HqDvlCGviU9yIBYfcVtMmg66OIEnjCVnJ_ZoCne
 5H8oiLUCt1iPokccfs8.V.SwSAfI6VNq6TNtmaBbyIt_5mOB98g15Z8z5UbHeGOTnJodqvYNyvXB
 sr4GgC5tYw7LG28Pgp60NiD2mnE7NMED3GDmYLXy604tj77BOGSY.jxrTDTUbICMOGfQCqP_d95.
 z2kstpBSATXjy4XynuaGD
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: 26699a43-c518-4783-a548-44db4a8ae695
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.gq1.yahoo.com with HTTP; Fri, 21 Nov 2025 11:12:42 +0000
Received: by hermes--production-bf1-694dc9467b-4n74z (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4f59f4ac5a1cd13c29c4f181447596b5;
          Fri, 21 Nov 2025 11:12:41 +0000 (UTC)
From: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Subject: [PATCH 2/2] android: binder: add missing return value documentation for binder_apply_fd_fixups()
Date: Fri, 21 Nov 2025 12:12:03 +0100
Message-ID: <20251121111203.21800-2-adelodunolaoluwa@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121111203.21800-1-adelodunolaoluwa@yahoo.com>
References: <20251121111203.21800-1-adelodunolaoluwa@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for binder_apply_fd_fixups() was missing a description of
its return value, which triggers a kernel-doc warning.

Add the missing "Return:" entry to doc that the function returns 0 on
success or a negative errno on failure.

Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
---
 drivers/android/binder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index a3a1b5c33ba3..535fc881c8da 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -4669,6 +4669,8 @@ static int binder_wait_for_work(struct binder_thread *thread,
  *
  * If we fail to allocate an fd, skip the install and release
  * any fds that have already been allocated.
+ *
+ * Return: 0 on success, a negative errno code on failure.
  */
 static int binder_apply_fd_fixups(struct binder_proc *proc,
 				  struct binder_transaction *t)
-- 
2.43.0

