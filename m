Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D73C3DA4D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 16:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E5683FE8;
	Thu, 17 Aug 2023 16:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3E5683FE8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AQLKDS97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wns_bQOcBk8g; Thu, 17 Aug 2023 16:31:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9DD7C83FC8;
	Thu, 17 Aug 2023 16:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD7C83FC8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8239EC0039;
	Thu, 17 Aug 2023 16:31:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7DB4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 16:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CB7A4224C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 16:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CB7A4224C
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AQLKDS97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SvQdXnM_7Kdu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 16:31:47 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA1244224A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 16:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1244224A
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6889656eb58so1316035b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692289907; x=1692894707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gTUiG3Uzc8lBmEAdnNxTTIOVJ6aRIqmu+UQYdbs/0nA=;
 b=AQLKDS97LyIhLPj8AD968FZ4So6lIlkG5PJiM8KpcuZOtsBXgm456iJWBEHuxIIWKs
 WJBMLiVzdLJ7PmOPX4dHpxLTpPnT7VNTpM6X/3A3uLZwMKzlecaWhukti2KzonqVayFu
 kQbe2GlzLvr+8DlCV3xzangFUoIxOmWFOVR6SiOQDXaxjunlEYDlShS9MlpkVbc6cziy
 b9XlRsf4CpQ6XkvdY+622Pmvk7TJhDPr94xG9Ju1wcdyljYSogakTF6f/H33BrJnP+xE
 pO8dUG7Y5q9R0NdsRv7uM77OOX7zc33foZmEBngPjQd/+pTrGjZWtCz8Al2+ZDyw96vR
 SDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692289907; x=1692894707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gTUiG3Uzc8lBmEAdnNxTTIOVJ6aRIqmu+UQYdbs/0nA=;
 b=ink91wcN2XZd0fXGzJo9eVl9ofNqB1ewCP+zeFF9ryWGDiVHavJvrZT8Mgk0gW7WqV
 C+PzfZpx8qsl3PrpADkgJNjwelxpCfhLtRw809SrKkfOPw6jAeoi2JsIKu5mp6WFHz6Z
 Sfh4oZwt7lSOtzec+HiwOxeEwG72bbDmXojftJjs8b09qbSU8Z3nsOg/jyEBlkvPwHpa
 pi4WrxW51cIG18vKNPSYAZK/ubzoOkl7z5/OhUuO8yJNDKyMlosfMZEVHR6q0Lz4Rotd
 vsmMbdKh8CE1mxKbGCAm7yPmZgVtPcyDjYzZQuYe3dbCx3hT2BJ0mTaZJ/fegtat7bIb
 LEbA==
X-Gm-Message-State: AOJu0YyCM0U7EjxPC0jLXx1HfnYwmqLNzdMXUwtzxQOcXlRyiBQBGj4U
 c7Fixy4NwpKJTMTQRzrlI0c=
X-Google-Smtp-Source: AGHT+IGfp9I34QqYFtb6+LmvEd6QtCBofUGRvrNZtrU7IumAWH8guLp9JQ6RtHC2It+kh7Zb9gJztA==
X-Received: by 2002:a05:6a00:17a5:b0:682:f529:6d69 with SMTP id
 s37-20020a056a0017a500b00682f5296d69mr52413pfg.7.1692289906899; 
 Thu, 17 Aug 2023 09:31:46 -0700 (PDT)
Received: from fanta-System-Product-Name.. ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 m7-20020aa79007000000b006887037cde6sm4212392pfo.60.2023.08.17.09.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 09:31:46 -0700 (PDT)
From: Anh Tuan Phan <tuananhlfc@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Subject: [PATCH v1] fs/dcache: Replace printk and WARN_ON by WARN
Date: Thu, 17 Aug 2023 23:31:42 +0700
Message-Id: <20230817163142.117706-1-tuananhlfc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Anh Tuan Phan <tuananhlfc@gmail.com>
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

Use WARN instead of printk + WARN_ON as reported from coccinelle:
./fs/dcache.c:1667:1-7: SUGGESTION: printk + WARN_ON can be just WARN

Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---
 fs/dcache.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index 52e6d5fdab6b..fd5f133b180e 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1664,7 +1664,7 @@ static enum d_walk_ret umount_check(void *_data, struct dentry *dentry)
 	if (dentry == _data && dentry->d_lockref.count == 1)
 		return D_WALK_CONTINUE;
 
-	printk(KERN_ERR "BUG: Dentry %p{i=%lx,n=%pd} "
+	WARN(1, "BUG: Dentry %p{i=%lx,n=%pd} "
 			" still in use (%d) [unmount of %s %s]\n",
 		       dentry,
 		       dentry->d_inode ?
@@ -1673,7 +1673,6 @@ static enum d_walk_ret umount_check(void *_data, struct dentry *dentry)
 		       dentry->d_lockref.count,
 		       dentry->d_sb->s_type->name,
 		       dentry->d_sb->s_id);
-	WARN_ON(1);
 	return D_WALK_CONTINUE;
 }
 
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
