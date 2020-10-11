Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9D9C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 16:40:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A1E21655
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 16:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIf8lz27"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54A1E21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04136864D0;
	Sun, 11 Oct 2020 16:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_j_tlFgITGc; Sun, 11 Oct 2020 16:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7653586027;
	Sun, 11 Oct 2020 16:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5119FC0052;
	Sun, 11 Oct 2020 16:40:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99206C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8308A864D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZCJTlN6DqLu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:40:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0FCF386027
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:40:12 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d1so2800938pfc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kW4wZOh5SNFY8r0+MwJCLa35u134N9OKe7lAtH4Lb/M=;
 b=rIf8lz27PuxfEsTLHR7X3z30nOgXaeGZ7ofJ9BEMZn9kjT69VCvppzoLc0VyK3qraK
 cUYgnonAXUHqf5f+mMiqN99B3zaOz4Uy1SexbWb6Fx/jJ3Nuv38htCVPkb7wP7C0Ph8j
 l9I54NHFEeMxS/avi9ZMvFGQ5aphtdUDraLQc2JliG8ZeShyACzEBpMbSJvt12GltNVr
 wYADuPyqvaa/upm7CQFviZhw+ZKf1M8//a8h5CqLo8NECpipcyJWHfN7ALGns4X5yUHN
 E4R3qtI6YQVw4P+jlnX54S1A+i4nJDKz4RYQprggScndOWTk5bEh5iDlAs2lpymOej3o
 YUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kW4wZOh5SNFY8r0+MwJCLa35u134N9OKe7lAtH4Lb/M=;
 b=FGlEkbnr8DuMhjOYh0RjpINUQzptM2YsfaLwnLzqT4JcZjS7DlsrhmzM6mZNcJ3Np3
 GdL17Tfld7mL59fGDrUzgAyfk21woCkxnQcSJ0x8dLCUN3UVOaYjhrqjhkWKkmMof9t2
 LQVSdu9vP4HixOeF7MMXJGgdeIbhhJCOlEU03cLnQ1m/+iISgMKXKIYQfpNv4bkbM3Lx
 2NGMJX6IB2s8ocj7CJJbQ4WKS60pYCBMo8d9Iupjeir6Z9tx6h/AVutRqEtooroPEivZ
 7aSldpmdlCSzeRIqNUnSp6gF/rJFSb1+EjypxsfaGrf8FniFjofRHhdzRR87wLFSzyEh
 IqjA==
X-Gm-Message-State: AOAM5327+pRXaUUiCE4p1XEuKnfRiaeQs6XM6o2Y/JCwhZkH59I8P395
 dFUt1nL347EZGsncgeo52rlh2Zy2DRvs3Q==
X-Google-Smtp-Source: ABdhPJwGAWj6KvLcBvCO/kZUl7mOMQlwBRS79Czn5nxxV5y4PMrb5kSnMDv43gGAurURBCHnh47YUw==
X-Received: by 2002:a17:90b:4b09:: with SMTP id
 lx9mr15847654pjb.76.1602434411932; 
 Sun, 11 Oct 2020 09:40:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id 126sm16989129pfg.192.2020.10.11.09.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2020 09:40:11 -0700 (PDT)
To: lukas.bulwahn@gmail.com
References: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <cbd50f33-9584-6751-80bd-f2c66b8f14b9@gmail.com>
Date: Sun, 11 Oct 2020 22:10:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On 11/10/20 9:51 pm, Ujjwal Kumar wrote:
> checkpatch script checks for invalid EXECUTE_PERMISSIONS on source
> files. The script leverages filename extensions and its path in
> the repository to decide whether to allow execute permissions on
> the file or not.
> 
> Based on current check conditions, a perl script file without
> '.pl' extension in its filename and not belonging to 'scripts/'
> directory is reported as ERROR which is a false-positive.
> 
> The script can correctly handle patches with mode changes and
> shebang line if shebang is taken into account. So, along with
> the current check conditions, adding the shebang check in the
> check conditions can improve the reports of the script.
> 
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  scripts/checkpatch.pl | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

To test the changes, I used the following scripts:

for i in $(find -executable -type f | grep "\.[a-z]" -v | grep "scripts/" -v); \
do \
hs=$(git log --reverse --format=%H $i | head -1); \
echo $hs; \
done | sort | uniq | \
xargs -n1 -P7 scripts/checkpatch.pl --show-types --types EXECUTE_PERMISSIONS --terse -g

Before patching, the script shows 21 false-positives.
After applying the patch, the ERRORS are gone.

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
