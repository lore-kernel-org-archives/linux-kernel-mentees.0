Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58029C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Aug 2022 11:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17B960E3F;
	Sat, 20 Aug 2022 11:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D17B960E3F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=fbzEaX1s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiV8Z18tm94H; Sat, 20 Aug 2022 11:41:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BDFA560DFE;
	Sat, 20 Aug 2022 11:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDFA560DFE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A3B1C0032;
	Sat, 20 Aug 2022 11:41:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE556C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Aug 2022 11:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9420840201
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Aug 2022 11:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9420840201
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=fbzEaX1s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ij9zzQ3G3Ayr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Aug 2022 11:41:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6B04015A
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF6B04015A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Aug 2022 11:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660995689; cv=none; d=zohomail.in; s=zohoarc; 
 b=bzuIDQA+sR7ZiWE9DXMgKg0fHNUajlNkGygoTkXW2MW91KjrK5GL9eOKirNwxsPs/bJnNxQhnrknPFPij2k245WT0qW3D9ehEf52EbnOgIYV5FcRmt0UP5siCMl70q70faYcZAIhWPVIxmBHPr5TFhT/a2VU0hP4X9HwO8DZyjU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660995689;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=OwlirewM9MHK3jNUDVvfjUe6e2E0DI0dbUmH8k2UzYQ=; 
 b=GenioD5MecWkzSLRl/rhBypTtzqh1kkoLFw6k0FFqzkxpS8oGBx2LQASZNBlwQiz/k/4V4pgo3lArz+X2njw4pConEvuJE/v7KG8BpzgJNyeYx7OKReBvZjRVN85YedcxivMXxYTRPt4qmBYAqWdgMypT1LoMkK5opXE1HDkF0s=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660995689; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=OwlirewM9MHK3jNUDVvfjUe6e2E0DI0dbUmH8k2UzYQ=;
 b=fbzEaX1s4LxtB1mccW6+EkXK8lpWzjKTQ6YE28zZS4Z1v0I+Fjkwh9aFFNlfRXMo
 oLl/vzp3vCh/x/gPreCbabPT6O+WmH2NSifKmHL3//s7PlDfHdeTVUoHkhGW4duTx4w
 3wcFsrXaZborYmXeobgoRkGXwvLhjr5Xo4i6GcaE=
Received: from localhost.localdomain (43.250.157.244 [43.250.157.244]) by
 mx.zoho.in with SMTPS id 1660995687489847.0225686061804;
 Sat, 20 Aug 2022 17:11:27 +0530 (IST)
To: Jens Axboe <axboe@kernel.dk>,
	Carlos Llamas <cmllamas@google.com>
Message-ID: <20220820114105.8792-1-code@siddh.me>
Subject: [PATCH] loop: Correct UAPI definitions to match with driver
Date: Sat, 20 Aug 2022 17:11:05 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-block <linux-block@vger.kernel.org>, stable@vger.kernel.org,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 syzbot+a8e049cd3abd342936b6@syzkaller.appspotmail.com
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Syzkaller has reported a warning in iomap_iter(), which got
triggered due to a call to iomap_iter_done() which has:
	WARN_ON_ONCE(iter->iomap.offset > iter->pos);

The warning was triggered because `pos` was being negative.
I was having offset = 0, pos = -2950420705881096192.

This ridiculously negative value smells of an overflow, and sure
it is.

The userspace can configure a loop using an ioctl call, wherein
a configuration of type loop_config is passed (see lo_ioctl()'s
case on line 1550 of drivers/block/loop.c). This proceeds to call
loop_configure() which in turn calls loop_set_status_from_info()
(see line 1050 of loop.c), passing &config->info which is of type
loop_info64*. This function then sets the appropriate values, like
the offset.

The problem here is loop_device has lo_offset of type loff_t
(see line 52 of loop.c), which is typdef-chained to long long,
whereas loop_info64 has lo_offset of type __u64 (see line 56 of
include/uapi/linux/loop.h).

The function directly copies offset from info to the device as
follows (See line 980 of loop.c):
	lo->lo_offset = info->lo_offset;

This results in the encountered overflow (in my case, the RHS
was 15496323367828455424).

Thus, convert the type definitions in loop_info64 to their
signed counterparts in order to match definitions in loop_device,
and check for negative value during loop_set_status_from_info().

Bug report: https://syzkaller.appspot.com/bug?id=c620fe14aac810396d3c3edc9ad73848bf69a29e
Reported-and-tested-by: syzbot+a8e049cd3abd342936b6@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
Unless I am missing any other uses or quirks of UAPI loop_info64,
I think this won't introduce regression, since if something is
working, it will continue to work. If something does break, then
it was relying on overflows, which is anyways an incorrect way
to go about.

Also, it seems even the 32-bit compatibility structure uses the
signed types (compat_loop_info uses compat_int_t which is s32),
so this patch should be fine.

 drivers/block/loop.c      |  3 +++
 include/uapi/linux/loop.h | 12 ++++++------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index e3c0ba93c1a3..4ca20ce3158d 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -977,6 +977,9 @@ loop_set_status_from_info(struct loop_device *lo,
 		return -EINVAL;
 	}
 
+	if (info->lo_offset < 0 || info->lo_sizelimit < 0)
+		return -EINVAL;
+
 	lo->lo_offset = info->lo_offset;
 	lo->lo_sizelimit = info->lo_sizelimit;
 	memcpy(lo->lo_file_name, info->lo_file_name, LO_NAME_SIZE);
diff --git a/include/uapi/linux/loop.h b/include/uapi/linux/loop.h
index 6f63527dd2ed..973565f38f9d 100644
--- a/include/uapi/linux/loop.h
+++ b/include/uapi/linux/loop.h
@@ -53,12 +53,12 @@ struct loop_info64 {
 	__u64		   lo_device;			/* ioctl r/o */
 	__u64		   lo_inode;			/* ioctl r/o */
 	__u64		   lo_rdevice;			/* ioctl r/o */
-	__u64		   lo_offset;
-	__u64		   lo_sizelimit;/* bytes, 0 == max available */
-	__u32		   lo_number;			/* ioctl r/o */
-	__u32		   lo_encrypt_type;		/* obsolete, ignored */
-	__u32		   lo_encrypt_key_size;		/* ioctl w/o */
-	__u32		   lo_flags;
+	__s64		   lo_offset;
+	__s64		   lo_sizelimit;/* bytes, 0 == max available */
+	__s32		   lo_number;			/* ioctl r/o */
+	__s32		   lo_encrypt_type;		/* obsolete, ignored */
+	__s32		   lo_encrypt_key_size;		/* ioctl w/o */
+	__s32		   lo_flags;
 	__u8		   lo_file_name[LO_NAME_SIZE];
 	__u8		   lo_crypt_name[LO_NAME_SIZE];
 	__u8		   lo_encrypt_key[LO_KEY_SIZE]; /* ioctl w/o */
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
