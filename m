Return-Path: <SRS0=9kH0=FJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63593C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Dec 2020 15:27:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E0723107
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Dec 2020 15:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E0723107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69C9A8769C;
	Sat,  5 Dec 2020 15:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-HIvWDsUd3J; Sat,  5 Dec 2020 15:27:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D307287698;
	Sat,  5 Dec 2020 15:27:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEBF0C0FA8;
	Sat,  5 Dec 2020 15:27:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE995C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 15:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DF074876E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 15:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQey9Cltc78X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 15:27:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 44270873B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 15:27:54 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id t18so4783979plo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 05 Dec 2020 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=aElOdsw7/TD/b9kzFjYcIj9QPsNet6KL1OLbBrf+xwA=;
 b=cwdOdbIqfZhDFApVuVn9N54E7Q1UhdeHPYGqfzYQJgUUgJ8N/EsJ2A5yImkMi7Tz5j
 1Tx1W7TWEVfHLRryeCy08sUSzoEI1+rrqmDk1TSxQcpHdCQCbjqafIJvJaXHIA7Mjdwi
 a9oUHEiU5qoRWiouF4NTBtXpVPUBw639eddG6K/qpyYrwT+dzzfFK54GlC5bFGycCEtN
 jqtGgb8XevpqcBGqbgwpQxGfVM/Cu51GF3nr4wbnIjutTf0uPwNK6R2qmu7oHMfh8ArJ
 heV6a/THSc/vOswR5AGMKZoLD5cR0jFzPe5ehukig48krXur1cbGSZ7fKtBILPPdJpB/
 PTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aElOdsw7/TD/b9kzFjYcIj9QPsNet6KL1OLbBrf+xwA=;
 b=jPY+JUVd4sx+kFTR+VXTgt0bG+Zj89OKYJYca55VH5vIGrFBifz8Xd8xlz+BPar13m
 jCYQe2Qs7oV46vPoeWdRCy/b4KZirR5d4ZwZ2S3mghRgGASYkXi2Lk4p4LiVDaUotJqx
 2zepa9ZaTMX8V0Dav/0kfBEsX3Bic3Qd55JTVIOh7sM+fVOjZwFRUV9RMuI+BN4Uc3nN
 hsQfm1+TUJOLRVRZPtrcAepVyH6yb6KPxI2XtAJ9883VZ40/HtA4hyn0SwbFc2HiOoRI
 5AbnWmmvginjMYc5ikimWy7d81pG0UbRnxF1dWKnq5U1xDbgkpFVccwS8NDLs0m0dgwK
 StPQ==
X-Gm-Message-State: AOAM533VAaa1IzX/QIJzhvoSN7T3NltK2DXt+v9wzKfezNB4HZBjfATp
 H+j+rtp+d6YCsavGZAN0g0OXhZMXEeMOvg==
X-Google-Smtp-Source: ABdhPJz5wl+OGMZiUAHOTBNNp6Fhe8+qs/Vm/OkKD4falk6Zscb3vU/oj7OVQ9PDu//GIbinbugbQw==
X-Received: by 2002:a17:90a:d3cf:: with SMTP id
 d15mr8628657pjw.132.1607182073400; 
 Sat, 05 Dec 2020 07:27:53 -0800 (PST)
Received: from ?IPv6:2402:3a80:405:a0b2:f8e7:94b7:3acf:b58e?
 ([2402:3a80:405:a0b2:f8e7:94b7:3acf:b58e])
 by smtp.gmail.com with ESMTPSA id d186sm8845903pfa.25.2020.12.05.07.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 07:27:52 -0800 (PST)
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
Date: Sat, 5 Dec 2020 20:57:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
 test-branch and run clang-format
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

On 5/12/20 4:40 pm, Dwaipayan Ray wrote:
> Hi,
> In continuation to our previous discussion about ways to make checkpatch
> apply patches into a test brach, and probably run clang-format to generate
> a diff, I wrote a small script which does the same.
> 
> It can be found here:
> https://gist.github.com/raydwaipayan/6b8d10470a163f7ae501c703bc27a83f
> 
> The script is still in it's infancy and more configuration options and support
> for patch series is pending.
> 
> Lukas, it would be great to have your review on this.
> 
> Thank you,
> Dwaipayan.
> 

Hi Dwaipayan
Nice work!
I was able to run the script, with few changes to the script. I'd add
my suggestions about it:

- The check with: "(! -e $git_clang_format_file)" doesn't work
correctly for me. Although the command runs properly, after I comment
out this if-section. Probably if we just check for a certain version
of git which added "git clang-format" for the first time, in users
system, it might do the trick.

- Also "git branch --show-current" is compatible only with Git 2.22 or
above (For eg, mine is 2.17.1). Maybe replace it with "git rev-parse
--abbrev-ref HEAD"?

Also, I created a patch for testing the script. Here it is:

From 842e18ecc9500fbd2e5d08c4a2b3e7e3c275b6bc Mon Sep 17 00:00:00 2001
From: Aditya Srivastava <yashsri421@gmail.com>
Date: Sat, 5 Dec 2020 19:38:03 +0530
Subject: [PATCH] temp

---
 block/sed-opal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index daafadbb88ca..f7929eb67f37 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -2322,7 +2322,7 @@ static int opal_add_user_to_lr(struct opal_dev *dev,
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
-	mutex_unlock(&dev->dev_lock);
+mutex_unlock(&dev->dev_lock);

 	return ret;
 }
-- 
2.17.1


Now this patch gets applied to a new "test-xyz" branch, but it is not
formatted, ie the added line remains un-indented. Is this expected
behaviour from the script?

I have also tried out something similar (using clang-format-diff
though). I'll try to add it in your script and send.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
