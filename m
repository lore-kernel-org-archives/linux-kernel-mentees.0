Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425A6C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Aug 2022 09:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5CB060B8F;
	Wed, 10 Aug 2022 09:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5CB060B8F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lQI08ncj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doZWWfYbEEMy; Wed, 10 Aug 2022 09:37:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D771B60ACA;
	Wed, 10 Aug 2022 09:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D771B60ACA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99C8CC0033;
	Wed, 10 Aug 2022 09:37:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52B95C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 09:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D8F140447
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 09:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D8F140447
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lQI08ncj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2sYbTwa_1w6R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 09:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 941674013D
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 941674013D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 09:37:12 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id x23so13760594pll.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 02:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=78dgYlqKO0ZvQjJz+sJd0671q+NGfvnDDEssu3bBwM0=;
 b=lQI08ncjvuLNvOWEIrCzsgcKgE2diNiQhT8iO8FvSLLMxYi9mCiO67CSzRUITu8LrB
 6Qinn3mOIdhfO4Yo8lA+blRSETuEGrdp3nzbzud4oM7pAaR3zKLqTHJ1s2MVZSi24aPO
 5lZAGgQnL717sdNqp2JFkR5rElvLbyQNeq4/cH7sJ6VfImDKU5rh8YgqAFAZr6rGxHCb
 cnQFjNUNFbhSznox4mcKEGPNdKFO+wP8WWLeswx3i+TuwBVYZFkzNVQiqbu25QrsuTCr
 DvZ7BEhcyuW5Nc/Gx2Humrtm3BxIPoHzopFS+r4rLMm7GQ3en8r9Ao1/fODPXoSVd/OM
 SJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=78dgYlqKO0ZvQjJz+sJd0671q+NGfvnDDEssu3bBwM0=;
 b=uJQwWQ67iBdLWeWlUxA4ELDgogRLVtuHlPpTndMsv2UsG0NT6pJ3krps77zRgKHFzD
 AyC/iYdyfc8SKwS/mxD0Kfu+h2eFSSfiYsm9awCnGggEeAgEgJ9VxKwEhnWgcE6sU7EQ
 hZKSnuLBa4QRpXJV/2xY0MyBCmZIFdpmQOghADijPOEgw+g+AfAU0q3LwtvEvXZHx/ZA
 rmL6/cokYxW+EIv11a8XOm4uCwg5w/2WOs8FCAI4W05saw3fdJ0/pk1zC7EgS6BtncqF
 9iHHDAMVZHgueoeYY3DCbL8MN1hVVqcjRjH/5cHI2N0tLlgT7VSXV9lnDsxuHN3cDN4B
 36OA==
X-Gm-Message-State: ACgBeo1/O+g+BH24o0S1lrUTUQNzuRXQZO/GuOnhoyV+odx7DABMwyY1
 2XyjBs7ceHKohBszAEyEAo0=
X-Google-Smtp-Source: AA6agR7YjYI12tnWvDGyWPfOPcugQ8xdwNLGNRCSJzyQgzH6ZBvqYbBkOtqw4ycTVf9Dab7Eme6PpA==
X-Received: by 2002:a17:90b:b13:b0:1f3:7ab:35b2 with SMTP id
 bf19-20020a17090b0b1300b001f307ab35b2mr2813942pjb.118.1660124231738; 
 Wed, 10 Aug 2022 02:37:11 -0700 (PDT)
Received: from engine.. ([106.212.112.163]) by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2c4e00b001f754cd508dsm1130979pjm.35.2022.08.10.02.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 02:37:11 -0700 (PDT)
From: Piyush Thange <pthange19@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com
Subject: [PATCH] selftests:net:forwarding: Included install command
Date: Wed, 10 Aug 2022 15:05:08 +0530
Message-Id: <20220810093508.33790-1-pthange19@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: petrm@nvidia.com, amcohen@nvidia.com, vladimir.oltean@nxp.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 netdev@vger.kernel.org, po-hsu.lin@canonical.com,
 linux-kselftest@vger.kernel.org, idosch@nvidia.com, troglobit@gmail.com,
 shuah@kernel.org, tobias@waldekranz.com
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

If the execution is skipped due to "jq not installed" message then
the installation methods on different OS's have been provided with
this message.

Signed-off-by: Piyush Thange <pthange19@gmail.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 37ae49d47853..c4121856fe06 100755
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -152,6 +152,14 @@ require_command()

 	if [[ ! -x "$(command -v "$cmd")" ]]; then
 		echo "SKIP: $cmd not installed"
+		if [[ $cmd == "jq" ]]; then
+			echo " Install on Debian based systems"
+			echo "	sudo apt -y install jq"
+			echo " Install on RHEL based systems"
+			echo "	sudo yum -y install jq"
+			echo " Install on Fedora based systems"
+			echo "	sudo dnf -y install jq"
+		fi
 		exit $ksft_skip
 	fi
 }
--
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
