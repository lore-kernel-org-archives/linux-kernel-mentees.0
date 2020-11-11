Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C058BC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 14:13:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D8A2072C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 14:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8iiLVHn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D8A2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 859BA8688D;
	Wed, 11 Nov 2020 14:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57q1DuZ0mzWa; Wed, 11 Nov 2020 14:13:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D76A8687B;
	Wed, 11 Nov 2020 14:13:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69059C088B;
	Wed, 11 Nov 2020 14:13:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAC4AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 14:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B0A0B864EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 14:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sS0v-2oC_I8d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 14:13:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5FB686388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 14:13:42 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id b23so808980pju.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 06:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=8zwe9GhhOvwfda3ryxuey7cir/F9yGi0h8i+RwPPqzY=;
 b=q8iiLVHn/SWVbg9HukWYn2KC/ta+XYQWgHxzZkwJE2tzL7geEiPqNW4KbQ9BqfYDIP
 cFfPI+VssUbIrMZ4pCP+Ab1YPFqjtiVQAAxLOyJp13TYy0r4kQRcbKMOYn/xJXKELw+8
 xp3OSjc2JgD3JdC70CFbsJYBOXxwC3adCHjemZ9033ENhJRBlh/wK/rP+KhGFSfniLkH
 wlqJf6aA/2h+2848ZKl64PFeEcYd1o2xfI2gpVSbguqv/zimCSUZvw4X1WBKH1/Mg8CY
 vV2fc2s+NQ4GPBNIlZDAwAfjQiP4IMqe8uML/y67Xy2g+kJnoFgEuxUDCekayKuM26RR
 Dy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=8zwe9GhhOvwfda3ryxuey7cir/F9yGi0h8i+RwPPqzY=;
 b=FsLwavfCwZqA2ivv8+TXyhe80Z8/2S7juUaDF7IcQiyWp2VuDbG0qLYBYFwhxNw3sY
 mQKl7z13xfb/TIXM24f7x2D5mgsSGru9FmSEFMSPOD7c11LLTeRQz8Tq6l5KS+GViuUd
 uRzX0VehXT8OAZ1MPgaChysICvtdAqCRThc7WRxtMvPPSD7cUySx8ZStqZeU1eUjr/G1
 uWimFUxF0H1xqkstsBKfBBTvNJgI8e13jrn+ExBsiM2FYfcUF/ox8LjhpGq59haivDEo
 trIm+ogsuSHWeGXkRRjVe+q3KFi8C4UlQfvW3GYad2arxYr0ISGnzeYBb2TqxLWfRBAQ
 ZUCA==
X-Gm-Message-State: AOAM531cDRKEUdazKmreb+rBdrAILQJeMXODblxL8DbY9DUZ1Dlc/ycE
 t4GdhjHdez9LArPLcYVXEckLxl4K/K2ejFkD
X-Google-Smtp-Source: ABdhPJxKuT2SdzpfU4HY0boOizd68vFO38hYKN+kjtd7nZ6Q+rE7G6R5gKPaR/mA3FYFM0ftKgkAWQ==
X-Received: by 2002:a17:90b:3002:: with SMTP id
 hg2mr3919164pjb.39.1605104021802; 
 Wed, 11 Nov 2020 06:13:41 -0800 (PST)
Received: from ?IPv6:2402:3a80:41c:a166:90d7:ac69:6d50:789e?
 ([2402:3a80:41c:a166:90d7:ac69:6d50:789e])
 by smtp.gmail.com with ESMTPSA id s2sm2689677pje.9.2020.11.11.06.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 06:13:41 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
Date: Wed, 11 Nov 2020 19:43:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Fix for BAD_SIGN_OFF: non-standard signature
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

Hi Sir
I have analyzed the checkpatch report for BAD_SIGN_OFF(over
v4.13..v5.8) for non-standard signature and generated reports for it.
Some mistakes are more frequent than others, whereas some mistakes
even have a frequency of 1.

Non-standard signatures occurring with their frequency:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt

Complete warning messages:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt

Should I implement the fix similar to TYPO_FIX, where we have a
separate file for common misspellings and corrected words? Or should I
make a hash of these misspellings in checkpatch.pl file as well?

Also should I include all these misspelled words in it? Or omit words
below certain frequency?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
