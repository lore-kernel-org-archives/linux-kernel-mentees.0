Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3A92D24BC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 22:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763157894; cv=none; b=lbQ3wBLcCe+NpW0bIcf8sNiRUE1orfakC7ao9nvLjqkkfRVZ8W/n/U1VyIMkAwhLGL3k7z5h0p/fz2WXRQq7Co+ElS6csWTm6gLT1dWnqFhplos2FWc+ZzJInC5h8PQA0awj3dRsNcjU2iUGgJBwdmnfvdUCiQ9oJNC7L6qbjk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763157894; c=relaxed/simple;
	bh=W2SgFxPhfn7FIVRm8Z/uPyhX20wpv50j2FNrmNYD4s8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=g1apajHkmq7dtPTOow1ymsNjWqlA+nYgGIvb+uOlkHMb6aTzLLgj3VBAlP1eRu9Y9ryQtOgbmiPYigLxI3OG3LU0ndDE0PWxkdjBAkqMb/j5P2/cl+6p86bfvOq8VSVE8Q5vNns+XC7mk7/L7gxDrvFBxBEMnK+12JHV/EiFvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=K6AGMy90; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="K6AGMy90"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1C2612A8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 22:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBUmjmMy3Cqz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Nov 2025 22:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=98.137.65.83; helo=sonic313-20.consmr.mail.gq1.yahoo.com; envelope-from=adelodunolaoluwa@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A95D3612EF
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A95D3612EF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=K6AGMy90
Received: from sonic313-20.consmr.mail.gq1.yahoo.com (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A95D3612EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 22:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763157890; bh=TzmiFzUmkKs/zWi2LzadwLCGjRnCMk2O7lj6+RzqUwI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=K6AGMy90jogjVcUBN+M63OKSxHLtwYvfAo4fBCBufiBbJ+f3tMJIQeB5oy3zrE48Zz1gYDAGA09PzXVK7VAV34UbkPIJ8u3nKOgantASJpWSEuyU0rJqz5LCkdsaDzra5J2Sp/qTwLVRS5n+wl+gPjIYq0P+SSq6mSkIYtYX2f9PuWC7pgtyTUhsRVNtu2j0RPurNLXULMJgHZ3mZ2rwCFjVYI8Ch17srHzuegfmrTl4a8X67cT6rYADv1uPuhUAjaNcZvHUeayX+CLtq6eLx67VqXkdIK2A83niJAhcTDJpNbKAqNFSZ1tcWmDQzH9iKfUuF1Y05tfrGNIm4eKn8A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763157890; bh=o3kA6kULFzmmhu/1NjJ03Z2zAFIMKU+9sSgfp3X2ypJ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=BYfRbzcXDB3DFCeNjqOw5hdVUFnXx6OEv+cGbsDKpO3c4sdM0CjERxrDQTJ2Uqp1mxUZKAwlh0v8HBVGEI67kXG28rAxrT2tLKPeRARi0WFUqjmVCvi5J9aME1uECCRbc+cjl3vOXZGIQcYeGjBkKL2YLsFV4H2ChvtoogsV7IKON04pE2Qy7VB8RcM4QL15vAw1WPd3WCxKm7XR/JAV1/vH1/fnAFd2VqxfFPOSv+Wx/wwYQ8utM21iGoODOTKtDpkKx8tvR/qMTFhmtc/Pw/Sg7o4gQn1W6zLAkD9EQGyZ2kHHBlATGCF1JUPLlM1/Q4ybyYTAK5jEm+pNpU+w9g==
X-YMail-OSG: uChzXZYVM1lnEBuSHPyLLbkpOyyyRn.JwkFXXbU17Mvn0FWxXTcVneWyx3I3B0w
 2vEGfe4.LIJTgqRLzo8Dx6mizA7zJ2bh1exhkF2zw01jj1bPYMjaCN6PnsFyLouUinDEaDD71Mkf
 iq5Q6RjxxPkNp_PsGk7LcHym5LzbBG0FdfZ9R3vSy910QRjaaKNK7GgaLQKf7Dy7ToE28n1R5DKJ
 CWLdVMYgtCszDPOfiroPEDkv4IZ4FJZfo0JF5osqPgrIMfsl5pHeTK9TGWkbjDv7cIvRyFq3bxHS
 iivPa6ETyw_4xtKqKcTGwvyxKwO8Mxtgqd3LRQ8EHQSIVfZUgmEiw3vVC4AbjD2fyCvmcHLIBtme
 sCwmCXM2HCGrTxSjpHKzG_BhZVsZUU8wvvM4XBvKq7_ISriNBhbcMdgNPJ8dbWIWNyus2tIwIWn0
 hujCpFs_hYlq2FNvxOzc2vumRKIvJP46NVWT2b9WS8ZK7h8LhDEpbrpdmbr31mlpclQxphN_VJlc
 7ZBrSqdk9UeDcKW.jxSU3fWse0oNiQgE7hn8gmR5SPbGibQM.AEAU6Z9VwQjwfiWHiGiODS5Y9FB
 kjDZM0qZalEQQiYCWkfWtnvUtwaSyF7kGuaMGIyN5KbNdGjGfvacLtTpPWABy60E8JtMY3gQOio9
 u0vKqyRNshZJ5QmwbzNwr05bFmmuOV3Yp_lcg_ER32pRohrhhl779deEhHwgDS3lLx2D6roE1siq
 z18b8kx0MWhijEbhz95do4wn9h7KOIY4WuuTKalivkyiqYyzJT3N8xbbB5fNpI7PMbqBurqrw9J3
 Dz4z2wRywnzwmfc6nttGvSLcmBBG08lEioo.Gv25VLjCZNJjPYhUJ4pKCSmbQWrHT6mCEbMF7v4N
 jT_YIbf2RN5E11Gu53C3fGm_3R.rjiMS9ZGdz3rn9qa8MIKADulOBlyQAzrC0P0cFHCyt.GAPGKc
 se2r.DzO43xtWExNsd_noKs7RsK0Qd0L02A0_KDgmup_uc_Ew_nkKlSAocOeiAKzb6.shdm2gUUn
 mmWe6T_N4lXh2L.31gCU2GSkNLmkCOuJOiAusXkzWBbDjjMpaL4_uU7typWkPgxeTm4tWvuYZOFT
 T2eS3hDJQOqhPYco.0d450U8Iu19ba6URRCv2Wd2MEmYPnO2zr3l3NE5buGnzviEYl._G.ABn25I
 _TdifRAdNrbvB4gzQijWiuFdDiFq8FVpceWMOEh8LveJfzOaqBjuawgFCNp15RmVQpA4tJJzaPm8
 Nrkl51rl7z.MPw7mBNm_pMNE0hUQX5Zy4Y5m75w0akr53_xf0mJma8J8bKuCukOyfqXWHzqWrHj9
 VGVX9wRoDB5oPS.epRx6nTO3ab62yDo9j6lLHSh0Q5JuRF9TpKqSmixDBxh1xq4onPbwefbrh23K
 W5SECYMyOnBWiI..FPGeVwMXmJAVNMjfXeDLw8w_ODwKhJNae0j3o70NZ2RkSPXnZzrz0Es8LIWP
 Ns8KQuc2Zphf9qABR7Pk251Pj6DwnG5OpcCi1Jo6rPjFMsx9RSzdM8apjjvQiivjn4QRVx.es59u
 .o6E0t2RaMV3fi76O5SBHoyqbxBfNPhPOpuLWrC4eKf6kpBiNflw17g5Bved2QOe9YEELQinZb6M
 dZUk_tkOEeGhgLiaVYpU0mIKEfL9d0r5RmSQoZ7H6Xkm_AiJZ74g2LtJuOkeyyau140d1dyb9aKt
 hA7YLWANcwVCBxOoiRDZVrRJ1SAS3XR9J.oVWzytXEMOzwKZH3UsRgKbUrWn3nP1V9wN9yFdjwda
 nXumWrgHgcTPbFUwF0ISegd1GCLmZOvPIOQBleGEzMyJ_dXAlHVutHAaiXIk.0jvEaW11KmClcNO
 XOPQsJjm3emX5YEvIYIXdtR3DBxf1qn8FyrJAhV5TPYkBeQMw7Ps1_0LOHhVEJVTlxyeXvfXUi.N
 itqNzeNn6D70jJCKysHHYCY2YJ5wdY2B.SRuuIsQ1RwGA3_RSm.Du8EyMBcI2UQdaXxP83NYZdfO
 7pp7civkW9s5eWoSIVx3nuRZfa43rtJEln9pHfxkLWgxtRu9NQmCIfYvp7DOGmVKgMWCYuDbE2VM
 Rtn40ATMdi1QivLcj5DLM3YUUbBVQl81gAqR6o8kTG91oLFZhGV6l6L9vm3O88y0GR3cZDH75EPm
 O0JkBJ8M05BekyjC5dcqWYRDWEkz9SRMHufXt6coc5uTkPUPk_b8sTUQCH4Byh9trcA6yr5kJsSL
 deJSUObery1_VuKkeMc_vXs9OidHeI18UKZo4KNq1_Aam1tkjID0pzr8keKMZye8TVEF.jBn1aXv
 MCkeU1qCvFTy0
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: 3c0a5b38-29bb-4cf5-9a34-ed7f599d05ff
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.gq1.yahoo.com with HTTP; Fri, 14 Nov 2025 22:04:50 +0000
Received: by hermes--production-bf1-58477f5468-cg9f9 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e7d9a9c0ed942aa3fd36f2c659798fae;
          Fri, 14 Nov 2025 22:04:48 +0000 (UTC)
From: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Subject: [PATCH v3] power: swap: Fix comment style and clean up outdated function headers
Date: Fri, 14 Nov 2025 23:04:38 +0100
Message-ID: <20251114220438.52448-1-adelodunolaoluwa@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251114220438.52448-1-adelodunolaoluwa.ref@yahoo.com>

Several static functions in kernel/power/swap.c were written using the
kernel-doc comment style (/** ... */) even though they are not exported
or referenced by generated documentation. This led to kernel-doc warnings
and stylistic inconsistencies.

Convert these unnecessary kernel-doc blocks to regular C comments,
remove comment blocks that are no longer useful, relocate comments to
more appropriate positions where needed, and fix a few "Return:"
descriptions that were either missing or incorrectly formatted.

No functional changes.

Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
---
changelog:

Changes from v2:
- Moved the swsusp_swap_check() comment inside the function as requested.
- Dropped comment blocks that no longer provided meaningful value.
- Removed unnecessary blank lines before function definitions.
- Reformatted multi-line Return: descriptions into a single line where appropriate.
- Kept only useful non-kernel-doc comments consistent with style guidelines.

Changes from v1:
- Converted /** */ kernel-doc style blocks to /* */ regular comments.
- Cleaned up indentation and spacing.

link to v2:
https://lore.kernel.org/all/20251113110914.44223-1-adelodunolaoluwa@yahoo.com/

 kernel/power/swap.c | 58 ++++++++++-----------------------------------
 1 file changed, 12 insertions(+), 46 deletions(-)

diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index 0beff7eeaaba..cf5736aabb39 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -336,16 +336,14 @@ static int mark_swapfiles(struct swap_map_handle *handle, unsigned int flags)
  */
 unsigned int swsusp_header_flags;
 
-/**
- *	swsusp_swap_check - check if the resume device is a swap device
- *	and get its index (if so)
- *
- *	This is called before saving image
- */
 static int swsusp_swap_check(void)
 {
 	int res;
 
+	/*
+	 * check if the resume device is a swap device and get its index (if so).
+	 * This is called before saving image
+	 */
 	if (swsusp_resume_device)
 		res = swap_type_of(swsusp_resume_device, swsusp_resume_block);
 	else
@@ -362,13 +360,6 @@ static int swsusp_swap_check(void)
 	return 0;
 }
 
-/**
- *	write_page - Write one page to given swap location.
- *	@buf:		Address we're writing.
- *	@offset:	Offset of the swap page we're writing to.
- *	@hb:		bio completion batch
- */
-
 static int write_page(void *buf, sector_t offset, struct hib_bio_batch *hb)
 {
 	gfp_t gfp = GFP_NOIO | __GFP_NOWARN | __GFP_NORETRY;
@@ -526,10 +517,6 @@ static int swap_writer_finish(struct swap_map_handle *handle,
 #define CMP_MIN_RD_PAGES	1024
 #define CMP_MAX_RD_PAGES	8192
 
-/**
- *	save_image - save the suspend image data
- */
-
 static int save_image(struct swap_map_handle *handle,
                       struct snapshot_handle *snapshot,
                       unsigned int nr_to_write)
@@ -671,12 +658,6 @@ static int compress_threadfn(void *data)
 	return 0;
 }
 
-/**
- * save_compressed_image - Save the suspend image data after compression.
- * @handle: Swap map handle to use for saving the image.
- * @snapshot: Image to read data from.
- * @nr_to_write: Number of pages to save.
- */
 static int save_compressed_image(struct swap_map_handle *handle,
 				 struct snapshot_handle *snapshot,
 				 unsigned int nr_to_write)
@@ -904,13 +885,6 @@ static int save_compressed_image(struct swap_map_handle *handle,
 	return ret;
 }
 
-/**
- *	enough_swap - Make sure we have enough swap to save the image.
- *
- *	Returns TRUE or FALSE after checking the total amount of swap
- *	space available from the resume partition.
- */
-
 static int enough_swap(unsigned int nr_pages)
 {
 	unsigned int free_swap = count_swap_pages(root_swap, 1);
@@ -930,8 +904,9 @@ static int enough_swap(unsigned int nr_pages)
  *	them synced (in case something goes wrong) but we DO not want to mark
  *	filesystem clean: it is not. (And it does not matter, if we resume
  *	correctly, we'll mark system clean, anyway.)
+ *
+ *	Return: 0 on success, negative error code on failure.
  */
-
 int swsusp_write(unsigned int flags)
 {
 	struct swap_map_handle handle;
@@ -1077,12 +1052,6 @@ static int swap_reader_finish(struct swap_map_handle *handle)
 	return 0;
 }
 
-/**
- *	load_image - load the image using the swap map handle
- *	@handle and the snapshot handle @snapshot
- *	(assume there are @nr_pages pages to load)
- */
-
 static int load_image(struct swap_map_handle *handle,
                       struct snapshot_handle *snapshot,
                       unsigned int nr_to_read)
@@ -1190,12 +1159,6 @@ static int decompress_threadfn(void *data)
 	return 0;
 }
 
-/**
- * load_compressed_image - Load compressed image data and decompress it.
- * @handle: Swap map handle to use for loading data.
- * @snapshot: Image to copy uncompressed data into.
- * @nr_to_read: Number of pages to load.
- */
 static int load_compressed_image(struct swap_map_handle *handle,
 				 struct snapshot_handle *snapshot,
 				 unsigned int nr_to_read)
@@ -1529,8 +1492,9 @@ static int load_compressed_image(struct swap_map_handle *handle,
  *	swsusp_read - read the hibernation image.
  *	@flags_p: flags passed by the "frozen" kernel in the image header should
  *		  be written into this memory location
+ *
+ *	Return: 0 on success, negative error code on failure.
  */
-
 int swsusp_read(unsigned int *flags_p)
 {
 	int error;
@@ -1567,8 +1531,9 @@ static void *swsusp_holder;
 /**
  * swsusp_check - Open the resume device and check for the swsusp signature.
  * @exclusive: Open the resume device exclusively.
+ *
+ * Return: 0 if a valid hibernation image is found, negative error code on failure.
  */
-
 int swsusp_check(bool exclusive)
 {
 	void *holder = exclusive ? &swsusp_holder : NULL;
@@ -1631,8 +1596,9 @@ void swsusp_close(void)
 
 /**
  *      swsusp_unmark - Unmark swsusp signature in the resume device
+ *
+ *      Return: 0 on success, negative error code on failure.
  */
-
 #ifdef CONFIG_SUSPEND
 int swsusp_unmark(void)
 {
-- 
2.43.0

