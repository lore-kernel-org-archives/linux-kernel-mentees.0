Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C09C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 08:42:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8669F2220D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 08:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jp0aoasy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8669F2220D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19E24860D1;
	Wed, 23 Sep 2020 08:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0DQfSBEb3xk; Wed, 23 Sep 2020 08:42:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F7E6860C2;
	Wed, 23 Sep 2020 08:42:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89AB7C0859;
	Wed, 23 Sep 2020 08:42:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8177C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 08:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A9B34860D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 08:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QTpt4FH4uCr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 08:41:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B3DE7860C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 08:41:59 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id z19so14597791pfn.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=oofs9i0QDElTVKrXinmC/MNAitSWEMYDE1Ov47qND7s=;
 b=Jp0aoasyasA6cHwlcftHQl7KNLBox6JZwmEW/P1oqcvfUBSJl1/T82+6I83Z9tAhOu
 9+7L1k5tC8hNbNKkHw2shP7MbPLZ3E+yUUxP4nZzMh62SZu599FSzb2MAxc/LiqmRHiK
 M8CsvgIriu2c5sKJzmPqFzEGudipm4IU0vptxCE5IK47nDqPL3+h6EKKefOSoK3lZlbf
 aPSixvQY0GpTIgV4FG5zJM7S7w3tlUq9eoXWg2RQn3/0cpUgv2ztAw+lP4TNd0hrL2CO
 LnpOPDBOiP7LamPVnd+oNbbv0Y/MHSoVnqvW9jcnq+uMJeSAq7cYxYEcoPBvdzp72Cf0
 T/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=oofs9i0QDElTVKrXinmC/MNAitSWEMYDE1Ov47qND7s=;
 b=X3MyaHHg6AvlVTQTwJZok319g1in1Ui8aFeWkTVDvcj5SnuSob4+7voM4+gd4QpKA6
 zYBt1bRD4rIyCnvlp5H2S1Rorlvf0p3bAcqcKstXl1PuHEzpTPEH5ga5DgXb2hQevHrn
 48kMV0lDI9dcap7UBRqwfnrznYyyUB3rSb+/tKZc3JZ8No2+XLvjwRhq4Dw+0QqfTlqo
 bjyml/4cCzK84OQxPSxjjobSyBkezY/brJV+zpdfHKQDs2P5OhzQtTktTBJPiCRzEKH/
 hKdju5ySBfclSVKm8zN3ro9IR3+jyLT77aT7zimG4yZ1LnXyvKb5dELLW/lq+mO1438g
 ozeA==
X-Gm-Message-State: AOAM533mIjPyynG3bQHedlk50S1S6TRWXmuCvGLJhoXVv9MlcoqIj8AW
 cK5NGXM3SG6vgs4DlN3ws8gM8uJ5XN8qwg==
X-Google-Smtp-Source: ABdhPJzuR2/yO7LjKsbrsylx2i09Wu4PHNvIDmYyBad/NEj0eDKzkPRv93mhUB+BMt3QQJdBgvyYUg==
X-Received: by 2002:a63:31c5:: with SMTP id x188mr6695132pgx.1.1600850518822; 
 Wed, 23 Sep 2020 01:41:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:2085:4633:7001:2dd8:81bf])
 by smtp.gmail.com with ESMTPSA id 25sm16997725pfj.35.2020.09.23.01.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 01:41:58 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <4e69c59d-2daf-e63a-bf83-75fbcd105b62@gmail.com>
Date: Wed, 23 Sep 2020 14:11:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Linux-kernel-mentees] checkpatch.pl investigation for
	false-positives
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

Hi Lukas,

I looked at different error messages and came-up with a list of
possible false positives reports by checkpatch script.

First, is about BAD_SIGN_OFF warning for Duplicate signature.
Though it is obvious to have these warnings but I am wondering 
about situations where there is some other signature between 
two exactly same signatures.
For instance,

commit 3f9c6d38797e9903937b007a341dad0c251765d6
    ...
    Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
    Acked-by: Andrew F. Davis <afd@ti.com>
    Cc: <Stable@vger.kernel.org>
    Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

commit 79ea1e12c0b8540100e89b32afb9f0e6503fad35
    ...
    Signed-off-by: Johannes Berg <johannes.berg@intel.com>
    Link: https://lore.kernel.org/r/20200604120420.b1dc540a7e26.I55
dcca56bb5bdc5d7ad66a36a0b42afd7034d8be@changeid
    Signed-off-by: Johannes Berg <johannes.berg@intel.com>
    
I'm not familiar how/when these situations can occur. But if these 
scenarios are commonly acceptable then the script should not report
 a warning for duplicate signatures.

---

Second, is about WHILE_AFTER_BRACE errors.

Example commit: 6f8a57ccf8511724e6f48d732cb2940889789ab2

The error message suggests to move the empty while loop with close 
brace of an if block which is not recommended according to the code 
style.

The possible correction would be consider checking the type of 
block that is ending and report only when the do block is found.

---

Third, is about EXECUTE_PERMISSIONS errors where the script reports 
an error for a python (possible with others scripts as well) script 
with file mode set as '100755' but file name does not include '.py' 
extension and is not present under the 'scripts' directory tree.

So, a python script file named 'binfmt_script' with file mode '100755'
 is erroneously reported by the script as:

ERROR:EXECUTE_PERMISSIONS: do not set execute permissions for source files
#39: FILE: tools/testing/selftests/exec/binfmt_script

even when it is okay to make the script file executable.

Example commit b081320f0693cce0394f7c8bad9fba0b25982186

A possible solution to this would be to use the script's first line 
for determining whether the file is a executable file or not.

---

I would like your opinion on these findings, whether any of them can 
be worked on.

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
