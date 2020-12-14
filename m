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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0168C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 07:59:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 604FA225AC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 07:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 604FA225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E453C861B2;
	Mon, 14 Dec 2020 07:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8FE8CbT0jOv; Mon, 14 Dec 2020 07:58:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6357F862C7;
	Mon, 14 Dec 2020 07:58:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20029C088E;
	Mon, 14 Dec 2020 07:58:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D0A6C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 07:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5361A8604A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 07:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnFOYyBNban4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 07:58:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CEBA185E51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 07:58:56 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id t8so11564951pfg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 23:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6b+ZRS9DmsS/G5g6tIAbIZZ5jkvMPonBxDT5Cg03Glk=;
 b=Nalk0bAAuJ3WV19QHKjKi4zG8pypGhHMMREkEHawPxD2V7ZHzwtQv1+J46OjmOMrpS
 AaKdfU9aFRxwmIKyT3RchJwDuSInYGnvqrVI59Am0qlMkK1j3bqhV7BvCmre2azEtBUu
 N1aP2sU/qZYBXV9ZS7wG/R5Tgx/jUhPo+PIt29cd+Iaoegyx2g6u7q1kg26BQWbJlaPI
 rkNPRQkQcw+BdXDB3PbsAItyEPQSgs2vjcs26U4oPDi7dpUFsNx8WRiW62iD2vtfIt8/
 yQyFZUMzOQzCJAz4oBiY+fJbJpQgCLegYpqaZaHcJUzXhY3OZrzqKBpOpxpGTOl5jE4U
 sQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6b+ZRS9DmsS/G5g6tIAbIZZ5jkvMPonBxDT5Cg03Glk=;
 b=YLmVf0LeWDD8C/6Wil4GlJsde09dS3l/2VQLdtQKqF0qmz+1Rj41j7gSaBdMW6uOuP
 qD61XxubyYMl+5ypXE0I3su67qYsahO9N454HGx50ltUeA4dsqHk7B67WjUa3dv5A+N7
 z9DTBf8oRL/CruEUyQcBn+XaRiE0YIYb5GB+hoL5bDfE2IgooAwkCzpSEdHklH73WE1M
 7jdUs2Knd2wDUQrFEjoK/RmW9V9NZK49xC1S4V/Z5+WbvgCFua3Cz+if2xy5ndHcLJie
 arp/ZOOu7uGk6kPNpCDcwtRgb+sW9ZYVQ7Av3o/eXllfQwjbpE98Ee+cfPFrehZAkfgF
 tQrQ==
X-Gm-Message-State: AOAM530lFVJmfeqGvejqJ5M2va6yzhbwLuZUXA9+bhS+EZBT6EQzAKrX
 g+RB/G+lN6UhhsgliJEmLPM=
X-Google-Smtp-Source: ABdhPJwIe9vEHKO3l1Ki6rafHiT1gaw6D6oR7GhGBUtwGoOfMcJiDSRxR01jZR8/A8FuAfpVjyfLBg==
X-Received: by 2002:a05:6a00:1623:b029:1a4:e935:87a8 with SMTP id
 e3-20020a056a001623b02901a4e93587a8mr6056029pfc.26.1607932736312; 
 Sun, 13 Dec 2020 23:58:56 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:68f8:3c95:3c1d:64ce:bfb7])
 by smtp.gmail.com with ESMTPSA id s10sm19042278pgg.76.2020.12.13.23.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 23:58:55 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Mon, 14 Dec 2020 13:28:31 +0530
Message-Id: <20201214075831.34282-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
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
