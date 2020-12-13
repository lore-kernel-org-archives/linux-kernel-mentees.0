Return-Path: <SRS0=B2kz=FR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC11BC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 08:59:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A0D22D2B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 08:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A0D22D2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CAE718733A;
	Sun, 13 Dec 2020 08:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-RWKynDBWtq; Sun, 13 Dec 2020 08:59:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3DD9087324;
	Sun, 13 Dec 2020 08:59:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F12CC0893;
	Sun, 13 Dec 2020 08:59:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0641C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AC8B58608B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOgxLha4JVTp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2597E86C82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:59:56 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id x12so6545829plr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6b+ZRS9DmsS/G5g6tIAbIZZ5jkvMPonBxDT5Cg03Glk=;
 b=OVb6MC4d9/HHInsC6JIweajtMRf6iyRJ6NZkXfbtfDLJUL587zVUt1J/iFA0+9Ea1O
 rjFf1qnowh1mIG3ay10A46dkdUe+EVJExoto8wdvY8In8BxrH+kNvdlaZYWZb5KURc6I
 KgL4pYBV2q4PrArN4LGWuqLil8KMv4L/vi5UHFouQvmlfMIodmNHnKAbh/z3975pRo8A
 4m6avC2tkBv5QXn4faxAe2EBZdNy2GlSmMDaPcLnyu0aL81dsoPj6rjGZftwoXpXJ2Fq
 1E57U8fNytreCdnUzgqiuxBddaiUgWQKnYbVKDHs8xv5ZiG3Lqz79avb7eHxu/8FcudR
 BqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6b+ZRS9DmsS/G5g6tIAbIZZ5jkvMPonBxDT5Cg03Glk=;
 b=K2rLyAa5DWbnd4hD8t2Qc9RzU+Om4245bJ3My/pV5FxFtFCSXPbMWJXPLrOPV2Qtbk
 abJW89nC4C4/rQGVFuTCBi7MjMLGjp37xSuW+Vu8LqTHNEuN6tDvinZFO0OM9MKS+hI4
 7xuIMU/BadG4Av0ZuQJGlXz58NV2iMDVGaG3Sen4EN23HUG+uGrWTZsVgS3hrq0igYRV
 QEnQ8I2nOHwoFWK4lN/o5VqVJ96ECBjFhgyBAF3U6LRGHlS16gVopQdMw5PG/c9yxTq1
 fDlaN2r/j0+SajnPNNqCNSsmtJ3uZKOwfp9gKmyv9xlzy9SdkNIqmZA+TXjTJwxtydR4
 9YXw==
X-Gm-Message-State: AOAM533OQ45GkpM77PoRkFl+/fKTQKS5x86h5N/Xbc0JDlPUYosBzgRs
 MsEydGHOu0yk5AVN/QK0XYE=
X-Google-Smtp-Source: ABdhPJwuBNtHwL4itCAS5O2pXEvgQ9+LEExgeM2u/vIiLg0yRWG/3/bEQG+3AYhDPNoPg10/wggGVw==
X-Received: by 2002:a17:90a:8c87:: with SMTP id
 b7mr17321956pjo.158.1607849995530; 
 Sun, 13 Dec 2020 00:59:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6900:3426:e6eb:3e68:8dbf])
 by smtp.gmail.com with ESMTPSA id s189sm15610725pfb.60.2020.12.13.00.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 00:59:54 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 13 Dec 2020 14:29:27 +0530
Message-Id: <20201213085927.33281-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] scripts: add more corrections to
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
+upto|| up to
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
