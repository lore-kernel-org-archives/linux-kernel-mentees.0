Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0D6C64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 15:52:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EBCB20870
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 15:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3OO+bsN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EBCB20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A78C88699B;
	Tue,  1 Dec 2020 15:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXxEedDYW-Tm; Tue,  1 Dec 2020 15:52:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4806D863E1;
	Tue,  1 Dec 2020 15:52:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 333D4C1833;
	Tue,  1 Dec 2020 15:52:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF5BBC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 15:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BDC2C86966
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 15:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2x-sCrcPR081
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 15:52:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 306FC863E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 15:52:41 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s2so1345820plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 07:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6o5gMMSvtsirv8A3lJ1VELCGK31nnDk84oF1prR1SUo=;
 b=C3OO+bsNAPr5DPHyVFklEPtPhPBFYVsVY73XPkZnQFwzAdY9jpI0mAXKEdu4LFHWAw
 EIvcLi8jZQHItGyfdxjOcD/27d0jYui+8eL6KbJuxAvsyuzVvXCfV4lwyXNS0emjXl3n
 yt+5s54DOSFRa3Nt8xI07me8gWMgyniYw04RDzLQoR+3WjneRM8qScNFybVmB/xkDndq
 2Zv5cKCtvuU+i+V51MNwBQMgmPAYoDUcLY5gcxa2glBdsjI80Nud3c+I47ECODycvu1I
 CH/gQmHaCZqKjVfM3OgF1sHBGfS65LWPkVBDtH/5nUkScQsTAKdoiZyOpcJTsVFm44ge
 M8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6o5gMMSvtsirv8A3lJ1VELCGK31nnDk84oF1prR1SUo=;
 b=T+H8DsW49/GnAX3DS+sO7ujQIqsAAOt83+92VKp3n9mn9Jgjlxls6Vf+4CbFJujkuj
 csEGUI2ZTD1BsFRzuCUKxum6qw7Um9UifaGUKS2HAIfrs86mqd5ZA46u8ceCusRi7HCB
 wcYOyNN363DOkulnmER6k48EluMp84OCT79vY2f5WWe7QTLrRFDVg+9y5HDIZMU2Q3ry
 yZqUrrfwGHm2oLxck8hfa1EwL0dymuuezdU1jgU7y/N/81BJiBnh7YBdBxYVR12yMwA+
 4dN6ePCZkqmvvna5i5gbmUaPcpXaINResOkMulSWUpe7Hmt4pBYXZrmjdkscstQbYS4n
 d7zg==
X-Gm-Message-State: AOAM531qLuBdNrAiuck2ET4Lm/S3KL0X8YaW/D38MJWT9ATOXMxbMgCW
 KQZb5yqSqX/wV9t56LOgY40=
X-Google-Smtp-Source: ABdhPJxLHk0S7/9nha5odWKhbfPmGLA60nxhoo7CDKc6jTzu4GQpBNQZjPQiMP+ItozdqYbpdmKEEA==
X-Received: by 2002:a17:902:b707:b029:da:a304:1952 with SMTP id
 d7-20020a170902b707b02900daa3041952mr1646684pls.6.1606837960616; 
 Tue, 01 Dec 2020 07:52:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60c8:895e:5a85:4183:13b9])
 by smtp.gmail.com with ESMTPSA id q4sm45711pgl.14.2020.12.01.07.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 07:52:39 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue,  1 Dec 2020 21:22:12 +0530
Message-Id: <20201201155212.132233-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add warning for
	lines starting with a '#' in commit log
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

Commit log lines starting with a '#' can be ignored by git if the
corresponding commit message is reworded by a maintainer using
git commit --ammend. This minute error can be easily avoided if
checkpatch warns for the same.

Add a new check which emits a warning on finding lines starting with
a '#'. Also add a quick fix by adding a tab infront of such lines.

Suggested-by: Peilin Ye <yepeilin.cs@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index dabe39ca819e..10665b9a3d77 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2966,6 +2966,15 @@ sub process {
 			$commit_log_possible_stack_dump = 0;
 		}
 
+# Check for lines starting with an #
+		if ($in_commit_log && $line =~ /^#/) {
+			if (WARN("POSSIBLE_IGNORED_LINE",
+				 "Commit log lines starting with a '#' might be ignored if the commit message is reworded using git commit --ammend.\n" . $herecurr)
+			    && $fix) {
+				$fixed[$fixlinenr] =~ s/^#/\t#/;
+			}
+		}
+
 # Check for git id commit length and improperly formed commit descriptions
 		if ($in_commit_log && !$commit_log_possible_stack_dump &&
 		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
