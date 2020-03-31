Return-Path: <SRS0=z0fH=5Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2DAC2D0F2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 22:29:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4100A2080C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 22:29:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="SqTtYT0z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4100A2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 01EDB888CF;
	Tue, 31 Mar 2020 22:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ipEcfI-mJpB; Tue, 31 Mar 2020 22:29:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 891A0888C1;
	Tue, 31 Mar 2020 22:29:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7427AC1AE2;
	Tue, 31 Mar 2020 22:29:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 277EAC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1526E204D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDSjuzgQ4R7H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 6FDD02044E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:29:02 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id i6so24996086qke.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 15:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oPoi9s3rBPglRyVbK9MBhYyYu13c18TXPi71CbVQVpk=;
 b=SqTtYT0zo8AT/7bG/6GBA7zmIQtZBva52UjWxHaBAFH+zgmuU7kyBugY6NFUaXrBeq
 6bpLplZ/sxNgCTGS+92/8O72wVE4sZk5JnRE9hviebuKNpjhvwB07/IFgkJDaRcJQy7h
 fuhNwVf929ETl+0pedmNfaLjcE6gQCPgmNiYbyEEOvQyyMjEEB/NnyIgd22LFEw/AZuN
 7C2/gDHepVW/RV9/LAVFXDS38kLVjNqCvWrmXNQPg96IRpjg4M3rcDYuAGn1ZPpKPhDp
 HEqFoAo+D/1O//ctK/ooKx2E1UughUQcITILG4SUJTd68YfHP938m95dYQPDW5HDg/uJ
 Y/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oPoi9s3rBPglRyVbK9MBhYyYu13c18TXPi71CbVQVpk=;
 b=n9LYuXvIrfkKw8WOEIGxlgEztEICg4xr9Yl0EmMn9cgJaeoDluq3Fo4Ymzzvq0QHeb
 iLtnomzYze8ziH56LHxDtINwfDh7R2PDbcJUV7hrTI9Sy6sBYKwO7AbJYMqKWzw+EqD/
 rWGFHU+rWwdv1LTEP2XlJJ+DUg2DIufhfZXuFGPZf9sQXZftYJa2wBOTsqrFKLY3NYRJ
 7Z0rQz6Jzf92/fj3My822IiUoTJSmkUHsy6TWPe/I0Ch9/QFH+9zzMXnZDywxyil57V1
 gvLGNEGNS1H3aU00f4qgT/Xe+6NT5yfpkUXzmCCp/JP4z6I4nSwrlpmFhg6erP6BLq+q
 d0eA==
X-Gm-Message-State: ANhLgQ2es/76SuGSLn61/2iTwMgipPpgwPZH53n7EK7Wxi9AyFdTWsfx
 FkfbFVd2Fbpsxs/LyfDz2CirrA==
X-Google-Smtp-Source: ADFU+vvCu4qHgFR6s5NfZIjtIf9WjNDoQvgV9EeC0cyylVFte2B6Dnv4zBvDYTCKukRVjzSX0xo2iQ==
X-Received: by 2002:a37:9b4c:: with SMTP id d73mr6568366qke.242.1585693741416; 
 Tue, 31 Mar 2020 15:29:01 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id 206sm238659qkn.36.2020.03.31.15.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 15:29:01 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Date: Tue, 31 Mar 2020 19:28:55 -0300
Message-Id: <cover.1585693146.git.vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: [Linux-kernel-mentees] [PATCH 0/2] Documentation: Convert sysfs-pci
	to ReST
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

Vitor Massaru Iha (2):
  Documentation: filesystems: Convert sysfs-pci to ReST
  Documentation: filesystems: remove whitespaces

 .../{sysfs-pci.txt => sysfs-pci.rst}          | 44 ++++++++++---------
 1 file changed, 24 insertions(+), 20 deletions(-)
 rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst} (81%)

-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
