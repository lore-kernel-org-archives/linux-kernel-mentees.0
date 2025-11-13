Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4802DECA5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052217; cv=none; b=jaUsDOsM0fXBgaHy28lyXGseN5Jq9A3rzE03/jMkcUy3v6MvNJR9mtLpWaGT5rIqyTfeFYYVX8613duTKXDcNzM3wjl+qgemseIDA7GXEpUIJsFq99AgR+2lJ65BAXZH/tHFTS5gnOk6eUbHHphh0mE1Gw6CaxzxyrRhKiyc8vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052217; c=relaxed/simple;
	bh=bPeX6yAcHSoyROEEyNBgQkfpVDseFZVhkN4TBEyu4m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=eGHAa/7f+P53VwSmZDGzlbh2ePUrqlS46Jq7yoch5tNnhFlEwpgyghS9AicVA2LeKMcz0yoRxT0pWIkpym/fFxwchXUaVwMgTRUKXxNspiYcxUmml0bSkLiTrtzYWDSeklmu0XPDZ5VdtxMtjt8wA4CWQxqIqupiV+iv+i6kyWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=OP+0sG/n; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="OP+0sG/n"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1EEC60FB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmXUbx_F8Gsl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 16:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=98.137.69.233; helo=sonic312-51.consmr.mail.gq1.yahoo.com; envelope-from=adelodunolaoluwa@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D6E760785
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D6E760785
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=OP+0sG/n
Received: from sonic312-51.consmr.mail.gq1.yahoo.com (sonic312-51.consmr.mail.gq1.yahoo.com [98.137.69.233])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1D6E760785
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763052213; bh=x19iUdnKVPH+qpaoKNf3a2w2dj+UVau7RDejBOQM1oo=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=OP+0sG/nyTgatoeV9Z3CbdV2kSGoEl3ZDHlnxIG3TUYWoEeONaBNwSp5ytFoTiWSYkSRhHn8FBZ4k53gHoeEeTOrIs4p0VWQfqB44N/PFtUVF39FL/jdbUmxNufokQXWlL/30ZZk1fuGt8j6ubzMJ9u3ieawAHXR8nPqVDVzDDMMWbJXbm8X2//1V0Ft5YZEY7UtksG/HaJtvBF9Bb2WnCpPsNWqAdsbyrLubFMbq9xnCO6LrnqtiX3D3Yo/1+SX5erh7lmqksl6BBUBWTQeG9iFzppJGdyJeKQGKC7j5HF1SopF9de2O7RHhL2geFmG/2FTa9hULQRcnMg3vZ0qnw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763052213; bh=ggQ3EgjU/f+5giO+UpjydcqL4GkiOaql5kyv3HCo+v5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=JXX1owa2g3IhmijgSObm+H+BgM1/x640L2sjrSMK0Qq9OXMHKxhFCNUweMD/9+3pZf0oyZVZ4swGnGJbHabrt8fo3Bqc4C/9e0J0b64W55edKNZ9ddx2m+dEH9nqJHKSU+hy+Hud4qi/nfYbAPOY96qMUXTBeaMvdFw/35lkjqDeU+Gj8bvVLbGR0jeuAgQx2uLmxf/HO6Ohu6ozmhjF995jPdMCXQ0Ld0BFmW7nP7pPnYTwG+zBoeFbCf1Z2O/T57kU+0c47CmiQH09tt2EcGNHIxb7TU0rodVc4gw6iOWhgKJWe+a3I4Ttf8tkWNd3UiwOoNqcVSTD1SbL6iIPwA==
X-YMail-OSG: 7J0GUQ0VM1lsfBBkKoB7atc_9SHZB1xOxUtOONNuwnDwzGSCHZ435N316zmffbr
 JUSc9VioZkNXojr_fCmF8Tvr0N27pOrMPcGLPi81qCmDGkQzpDmrLbBxjwiaGS48GJSs1RHYmsX3
 dUUsjqw8juAtIhImMUNxyrOfz1HGtwX_TeiIuhkpOtQQSOGU6h6.vUe3AMeaEMLkKQaY5vK6iZQn
 IQ.nXvsFcJ22SgMHXJ_IG4E5BAvM4rgqneBmjJS0wVZ.oolbCKF1BYW99bDM_87A9.vyG8dVKkp4
 0mqsCAGSIJ82fcG3SLjBxdUmoDQi63RKYJJrqBOuuXuM2.2Hzp4r_M3EfSGYEyVJs9u88Rj.TfVr
 qCuqNwIkpBrlw0BqsyEeVsX_QCP3BD0LWrH8uL5FBsdK4InFOnPQD9DmsC0kZgpgpzHdeZK6jqjB
 5tRtb1rL2abD.5PlLqQZJl5VUfOdP0_MrLBOccx82Yol3eoNoRbcIMHZKI6mxfCIoiqOXOd_xR8R
 faXkD54c5e1TOF9e.p0xQfuX4ibMN0ybK3WZ2pQ1DMo4RplNMJejv0PJNu6EToPilPDjwcmlo5pU
 QtJ49hmjEuUCj5umgTM4SvYq3QG9gQwHNuevmKvlEjyGsBhYPfIMuryHVv.nAsY4Ks4qHMUs3Lbf
 qRynbsYN7FsHSQi87zUrMiHoz42r29so6kYy8eKB5lYP8zUzWE97CihOshYJ410MvHLwYI6OLV2j
 qRR7FyjS_3i6tkJGHnweyKQBA.9VXu4qzhnsNVVYrHrPti9Y7AI9Vt.MKIWBUfnlKaXIpFA2Rx9y
 OvuL8GD4hVd7qpkYBJOvB7z2qb9cB1ZtaZHvQgLBeYRaZbCV4olp2RfANq31.db5PBiXhlGQV5Vv
 KOrVo_1OqbpoAWI.2hE67snBO6pfn0B27yMnME3Dl0l_gcw4HtXIE.nqa0rlDWlVl8GLtkgr3Tr_
 iCkaUQCUIjcuTqj_LLdOaHFFBxDpgdojZT8x6S0KnT9p9OpkFeuqbRXqWfD4VzQv_sQcJiPUCTJ4
 FTyctTNGY4aRTBg_QrPqYk3prrC_ymlFodkqCuSE7LwevF7lvB5JPjfguicB9V9XaD2KZY2ySvew
 7Wm0fDjk4BfP6odFamkv4twCCvILnVzAkNXe03xdM_CORj8NFJUU6sbaoy2.x75rQpYJIQlY6aHB
 lbqWrjcqkek0kEEU6o7RxB181txo4i7cLdpPq2qW6gimcmZ.cD1ym81hdbZFGkoG9uZkbtVQBS1_
 WZSGSERDDQ6CoM4TKkhvZOVPfEH5cN3usv_eIlKCJp7UOWo9u6e2npnj2ZkuAPLErbtEms0XG_ts
 BBuEhEcmbjZjLYUbABZKiH_kDWWcrPqxp3asz1GLh2xkPcqIY5GztJtcNlV0VeZh9P7KqasqnTEA
 JwPEzQ27EyUlL2rKRBNixgjFXjb1UV9tlODZr.VSiDRDC8Z29iQPrk7PKh3b893Z8AsfBLDHrPU1
 ZFxBI3E4xDANXThICF0WAIei716dT6T35FLsjGV5niJZOcstauPCc3ewCkSHRn8HB2G1z5.v9oWz
 HhnBaeouiMe38tkuh2Gc0KkKPhOHn67GI94p6loz.cbJCNAE1EOD8gKl6uVYaceDSD.O8qFD95pL
 f3CW.SvePzmvCV.9ZH2BrvbDox8ItohhVlZBFKsEtuPNuPGh0DGcUN9zig_AzEVTkPMSnNG7YkIu
 YOFKSht8kRAjFRRDwcFeaIkf0rEweHDSEdo0arQVNjgap6UqlMzQytoHmepx_7Pua3veXfa67Qm_
 Cci0YlMsneyyO0J9brANnFr1RFh5ZzdWvohiUAGPKnRsAjxSqHDGpFDU75xJB2iDMcb73Pv4nisy
 ja4K77_WT80hvB_L.7tf.uKTjdGBNPgVPNm7bkfSSSd52pBnwbWK0FxWcxEnlxDI02rUZWR9.wFx
 MY_1VJiPmeVJdYs2h_wF37KOBvCrs99d9iCN4yqisw_EIkchheS2wkhE6b7zN50FWFV0keqx7zRS
 W27VhcgMp8sUFVTERXtCUAqrGX4yaAuJgs6fjxNHjygT0YEDXMx0x.JzKwUo2TW6r7eeao.Pb20M
 IrRTC9T5Ulv5qzewy2p3CRhud207xZAezCGWUwp8VnU1lx9h5jl_PLv9FbCQQ3EIL9VX2775.AsG
 Wp5eOVK0zVFOcSfyHccXHt8yBQTA0aR79e2gQ2XOCme55OtbUeuh2RnAuQuor7MTcAJ9BoDXmqzI
 uoBdoM2I62B.Y_xmQZqp1kz5VLNHmIZGJCkVCgTWM5HW60FhZmZ1zztoA51S94LbtVGDMXJkxz_K
 yRnhrlPsAFeFBJhpztraxQ1lDM4iyXYbmYH.I1xgrMWQKF9m6h.1OWhqtu5iYi3UYc6yTf7FBfEY
 j2BEB0m.K9wzf
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: a1394f0c-fff8-4e42-88d8-2251506a1172
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.gq1.yahoo.com with HTTP; Thu, 13 Nov 2025 16:43:33 +0000
Received: by hermes--production-bf1-58477f5468-5j87s (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 06e38092b890c9492e3ff8e544d7550f;
          Thu, 13 Nov 2025 16:41:31 +0000 (UTC)
From: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
To: haren@us.ibm.com
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Subject: [PATCH 1/2] lib/842: Fix kernel-doc warnings for sw842_compress()
Date: Thu, 13 Nov 2025 17:40:18 +0100
Message-ID: <20251113164019.48840-1-adelodunolaoluwa@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251113164019.48840-1-adelodunolaoluwa.ref@yahoo.com>

The following warnings were reported:
  Warning: lib/842/842_compress.c:467 missing initial short
	 description
  Warning: lib/842/842_compress.c:478 function parameter
        'in' not described
  Warning: lib/842/842_compress.c:478 function parameter
        'ilen' not described
  Warning: lib/842/842_compress.c:478 function parameter
         'out' not described
  Warning: lib/842/842_compress.c:478 function parameter
         'olen' not described
  Warning: lib/842/842_compress.c:478 function parameter
         'wmem' not described

Fix several kernel-doc warnings in sw842_compress() due to missing
function description and undocumented parameters.

Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
---
 lib/842/842_compress.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/842/842_compress.c b/lib/842/842_compress.c
index 055356508d97..0423e3af20ee 100644
--- a/lib/842/842_compress.c
+++ b/lib/842/842_compress.c
@@ -465,10 +465,12 @@ static int process_next(struct sw842_param *p)
 }
 
 /**
- * sw842_compress
- *
- * Compress the uncompressed buffer of length @ilen at @in to the output buffer
- * @out, using no more than @olen bytes, using the 842 compression format.
+ * sw842_compress -  Compress the uncompressed buffer using 842 format
+ * @in: Pointer to the input (uncompressed) buffer.
+ * @ilen: Length (in bytes) of the input buffer.
+ * @out: Pointer to the output buffer where compressed data is written
+ * @olen: Pointer to a variable holding the maximum output length.
+ * @wmem: Working memory used internally by the compressor.
  *
  * Returns: 0 on success, error on failure.  The @olen parameter
  * will contain the number of output bytes written on success, or
-- 
2.43.0

