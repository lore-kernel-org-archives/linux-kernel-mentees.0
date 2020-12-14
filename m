Return-Path: <SRS0=WLyE=FS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D3FC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 08:02:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C89A225AC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 08:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C89A225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8028120490;
	Mon, 14 Dec 2020 08:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCpNnYSxKXMT; Mon, 14 Dec 2020 08:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 47C8B203DF;
	Mon, 14 Dec 2020 08:02:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 357FFC088E;
	Mon, 14 Dec 2020 08:02:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B33F3C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 08:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9A54220481
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 08:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbIa5iKPZ5AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 08:02:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id A525B203DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 08:02:18 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q22so11558374pfk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 00:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GjJyoj6HEnn8S41rMLrhQESVG/OibfeqXfc4YY2wvNg=;
 b=gmJFyvLRjkZKf5B4WcUqx9uRzIFrei+BT1jX95Tpg1FZIgOU+sz7v8vDxjVcvzwvrH
 IJc4j85T4fOJhBlu9bfD+yNMYlBch3IB+0yU7oQrZnAIzc8JFMoa2XdlC65khbmvCrIg
 B/P7QX1u2+74gz1ldeTzJTexKgpPiwCNz1HagQn5vtGypCV8j1j43ISuDpRpwToKxzSW
 G41O4WC2kG/yxz164/nR9M+KqjKzE7pE6i3FJODjmmoWnu2WB9bcp8BxEaDhI8KVQTY1
 ak5pB8tdZIZnSIpC1hnMsX4t0mIk5KRJAldrbXwOq3uWXPozah8ikuzhJQs4MQaYxwn+
 yjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GjJyoj6HEnn8S41rMLrhQESVG/OibfeqXfc4YY2wvNg=;
 b=QWg7UAqCRFZP2JQrJtEPM5XvR7bbFdqKdCajPcdoinkK1vJH2QuitheT5lrTbPL88n
 VaKGkc6aHPPvpAaee1D9GfH8RBNRmLrMX7J5wPdfG/KDhdXZzYt5vIQRzfL6P2BGnWhi
 FcfyqU2V9Zgxk3QogHJ9OdD+IvtN4nGd750/3Y5Pyz7Zn7SugB0aBX2Mr8VKiCDCPXiW
 RWh57wkTLqK1l6f+rTtfTCl58yrHyFPfnWdWLJNQdpVJl2RLP+JnfJQto4HKuWPeS3xA
 DGFLndloVUOQFIILNBBXS3F4Ex3HdlpiSvMezR4e5NnblToR5p//w27FsxohhqB0Msqw
 oz4Q==
X-Gm-Message-State: AOAM530EkQCvpJc+X+0eQ7ak8Sod6IqQENybyEuNxda/brd2wP0Vh9+t
 ifLyVPwN1yykEBqMwSpdrAw=
X-Google-Smtp-Source: ABdhPJxjA4Nmo5rAaQa/vV8917Z0AYXTrx37DzCtfWush8Yx6bCndQLfMbXs0NDiM1Y/ovPIGpcP3g==
X-Received: by 2002:a63:65c5:: with SMTP id z188mr7863980pgb.332.1607932938079; 
 Mon, 14 Dec 2020 00:02:18 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:68f8:3c95:3c1d:64ce:bfb7])
 by smtp.gmail.com with ESMTPSA id a142sm14396932pfa.188.2020.12.14.00.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 00:02:17 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Mon, 14 Dec 2020 13:31:56 +0530
Message-Id: <20201214080156.35072-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] scripts: add more corrections to
	spelling.txt
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

Analyzing misspellings over the past 10k commit messages,
a few more corrections are added to spelling.txt

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
Changes in v2:
- Fix additional whitespace before "up to"

 scripts/spelling.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index 953f4a2de1e5..cf2453ddb216 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -315,6 +315,7 @@ commited||committed
 commiting||committing
 committ||commit
 commoditiy||commodity
+comon||common
 comsume||consume
 comsumer||consumer
 comsuming||consuming
@@ -347,6 +348,7 @@ condtion||condition
 conected||connected
 conector||connector
 configration||configuration
+configred||configured
 configuartion||configuration
 configuation||configuration
 configued||configured
@@ -437,6 +439,7 @@ dependant||dependent
 dependend||dependent
 depreacted||deprecated
 depreacte||deprecate
+derefencing||dereferencing
 desactivate||deactivate
 desciptor||descriptor
 desciptors||descriptors
@@ -608,6 +611,7 @@ failue||failure
 failuer||failure
 failng||failing
 faireness||fairness
+falg||flag
 falied||failed
 faliure||failure
 fallbck||fallback
@@ -722,6 +726,7 @@ implemntation||implementation
 implentation||implementation
 implmentation||implementation
 implmenting||implementing
+improvments||improvements
 incative||inactive
 incomming||incoming
 incompatabilities||incompatibilities
@@ -801,6 +806,7 @@ intialise||initialise
 intialization||initialization
 intialized||initialized
 intialize||initialize
+intead||instead
 intregral||integral
 intrerrupt||interrupt
 intrrupt||interrupt
@@ -1151,6 +1157,7 @@ recyle||recycle
 redircet||redirect
 redirectrion||redirection
 redundacy||redundancy
+reenable||re-enable
 reename||rename
 refcounf||refcount
 refence||reference
@@ -1253,6 +1260,7 @@ senarios||scenarios
 sentivite||sensitive
 separatly||separately
 sepcify||specify
+seperate||separate
 seperated||separated
 seperately||separately
 seperate||separate
@@ -1334,6 +1342,7 @@ substract||subtract
 submited||submitted
 submition||submission
 suceed||succeed
+suceeded||succeeded
 succesfully||successfully
 succesful||successful
 successed||succeeded
@@ -1354,6 +1363,7 @@ suppoted||supported
 suppported||supported
 suppport||support
 supress||suppress
+suprising||surprising
 surpressed||suppressed
 surpresses||suppresses
 susbsystem||subsystem
@@ -1475,6 +1485,7 @@ unsinged||unsigned
 unstabel||unstable
 unsolicitied||unsolicited
 unsuccessfull||unsuccessful
+unsued||unused
 unsuported||unsupported
 untill||until
 ununsed||unused
@@ -1482,6 +1493,8 @@ unuseful||useless
 unvalid||invalid
 upate||update
 upsupported||unsupported
+upto||up to
+uptodate||up-to-date
 usefule||useful
 usefull||useful
 usege||usage
@@ -1499,10 +1512,12 @@ vaild||valid
 valide||valid
 variantions||variations
 varible||variable
+varibles||variables
 varient||variant
 vaule||value
 verbse||verbose
 veify||verify
+vender||vendor
 verisons||versions
 verison||version
 verson||version
@@ -1528,8 +1543,11 @@ wiil||will
 wirte||write
 withing||within
 wnat||want
+wont||won't
 workarould||workaround
+wraper||wrapper
 writeing||writing
+writen||written
 writting||writing
 wtih||with
 zombe||zombie
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
