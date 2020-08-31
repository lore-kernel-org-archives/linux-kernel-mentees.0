Return-Path: <SRS0=Gq3P=CJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E615DC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 05:14:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D4A420719
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 05:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUQ98AyF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D4A420719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E9A985AE4;
	Mon, 31 Aug 2020 05:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_iw8zxjuNif; Mon, 31 Aug 2020 05:14:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30B2385AF1;
	Mon, 31 Aug 2020 05:14:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18F69C0052;
	Mon, 31 Aug 2020 05:14:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30C0CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 05:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 262F687935
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 05:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-d7-gqWP3CX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 05:14:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 12E9487934
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 05:14:08 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id ay8so4208511edb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 22:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=DEc8Jdy55iwpCAZSqbLxzGUHEo2q8yG6Yi50caJ9QyA=;
 b=EUQ98AyFRQpnNbQqhufMzMiu2TMPWzhCfucBl4Jd6fIS4gLN2kH8GgEarHOF7nXEAb
 5P/07CBt4RhRK7Kxf5svCkWxQl5Xn/d15tyutie/fcFWvwFjASn02OmZjHfK2/TsrKvr
 qwo/KLxvIAhgbsBFgEf5kH7Vv4yg/uXluy+EaKYHmFCBthwgBz3xFVmUI41wDXd6cWTL
 2xR0ldKRY82DVEuRK/gWsBFvX81MPOJ9x2bUi0aTzrPsKzNcfu8JTBIz09FXgO3/CEjK
 hcXyXzW83i2CHPOTy/Ak+VN6vX4auErCAVTYYSS5C9BGcQPXGklo/FHwRd+8XGXhAAiL
 hChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=DEc8Jdy55iwpCAZSqbLxzGUHEo2q8yG6Yi50caJ9QyA=;
 b=kSalTSIhHsQwycnWO4bsa21AcEfvHnwsS8VeirVjPcl3K3LsAeFKSo8erxKHDzHxXH
 tHY9WQlE3Cx4IV8O08Ir6Ks/qTVpsDcYIZ7OC2E0/a8QlL0gbWmL3WQigrMxmXao0JqA
 us3tqp4AlEg1irscHsjnXJsS02wCBkZd69SSdMA0o0jbk0yBHBYqv9HaGxG7D+GWBF+u
 qznL2H3YibImWKN18ws/vxzlbHDQVNDvAcxi5zjsBpx+S13miG1LxMdXEbJ1oxtQgUAP
 r68XcA7u2pQOhQwPwEfH4vlWjrvtm6G+wfWFdoRvjUndj/cZlCAVjgWilCYHntFI58Ki
 Geyg==
X-Gm-Message-State: AOAM532Vk0lY6Dt0skhdCVGSNembjUUw3Y2jwAY5rSXzE9YzLtSHq+UW
 lgZ2x+G4OL4LmzmDWA2WBkg=
X-Google-Smtp-Source: ABdhPJw7ku51dzp4GrvpMpH15HS30AsVGKhrPfshFJfzVXnNhLCSJBnA9qCRt6jt3hA3NG6VgYw/ZQ==
X-Received: by 2002:aa7:df84:: with SMTP id b4mr9489978edy.75.1598850846526;
 Sun, 30 Aug 2020 22:14:06 -0700 (PDT)
Received: from felia ([2001:16b8:2de1:2200:9c37:36bb:80e7:91d])
 by smtp.gmail.com with ESMTPSA id d9sm6530263edt.20.2020.08.30.22.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 22:14:06 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 31 Aug 2020 07:14:00 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
Message-ID: <alpine.DEB.2.21.2008310702520.8556@felia>
References: <alpine.DEB.2.21.2008270707440.9436@felia>
 <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
 <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Regarding "Linux Kernel: Evaluate and
	Improve checkpatch.pl"
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



On Sun, 30 Aug 2020, Ayush wrote:

> August 27, 2020 10:59 AM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
> 
> > On Mon, 24 Aug 2020, Ayush wrote:
> > 
> >> August 22, 2020 1:36 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
> >> 
> >> On Fri, 21 Aug 2020, Ayush wrote:
> >> 
> >> Hints to the first task:
> >> 
> >> Can you create a list of all non-merge commits that were added in the
> >> version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
> >> and not already in v5.7?
> >> 
> >> Can you share the script/command you executed and the resulting list on
> >> github?
> >> 
> >> Can you run your script on all commits of this list above and record
> >> all checkpatch.pl reports, and store them in your github repository?
> >> 
> >> Can you suggest ideas how to aggregate the findings and create a
> >> statistics? For example: Which type of error is reported most?
> >> Can you implement that idea?
> >> 
> >> I also suggest to have a look at
> >> the options ./scripts/checkpatch.pl --list-types and
> >> ./scripts/checkpatch.pl --show-types. The option --show-types changes
> >> the output of checkpatch.pl to list type identifiers, so it is easier
> >> to parse and aggregate the output.
> >> 
> >> Please also share the script you create for that purpose on your
> >> github repository.
> >> 
> >> The second task is to pick one warning that appears often and improve
> >> checkpatch.pl to handle that better and get it accepted by the kernel
> >> community.
> >> 
> >> Hints to the second task follow when the first task is solved.
> >> 
> >> If you fail on any of those tasks, you are out of the selection process.
> >> 
> >> Lukas
> >> 
> >> Sir,
> >> 
> >> I have attempted the task 1 and pushed the same to GitHub.
> >> 
> >> Please have a look and suggest improvements.
> >> 
> >> https://github.com/eldraco19/evalute_improve_checkpatch_pl
> >> 
> >> Please let me know if there are any issues with this.
> >> 
> >> So far, so good.
> >> 
> >> Here are the questions we want to answer:
> >> 
> >> - So what are the 20 categories that occur most?
> >> 
> >> You are getting close to that answer, but you are not there yet.
> >> 
> >> Then look at the findings. For those 20 categories, are there specific
> >> findings that are multiple times false positives?
> >> 
> >> So, the script complains about something, but it does not get that the
> >> patch author wrote something completely unrelated to the error message.
> >> 
> >> Lukas
> >> 
> >> Sir,
> >> 
> >> I tried the given tasks and it can be found here,
> >> 
> >> https://github.com/eldraco19/evalute_improve_checkpatch_pl/blob/master/STATS.md
> > 
> > The solution is implemented a bit complicated, but well, at least, it
> > works if I believe your report. (I only read the code, but did not run
> > it.)
> > 
> > The goal now is to find a class of false positives and improve
> > checkpatch.pl accordingly.
> > 
> > I suggest that you look at the specific DIFF_IN_COMMIT_MSG reported
> > errors?
> > 
> > Provide a short assessment for each DIFF_IN_COMMIT_MSG error in the
> > 10 commits.
> > 
> > It should tell:
> > - what lines in the commit message did checkpatch.pl complain about?
> > - what is the pattern in the commit message?
> > - does patch(1) really stumble over that pattern?
> > - how would this pattern need to be provided to patch(1) so that it
> > would stumble over it?
> > - if no, why not?
> > - can we change checkpatch.pl to not raise an error for such a
> > situation? So, only raise an error when the pattern would really make
> > patch stumble on it?
> > 
> > Depending on the evaluation, we might continue to improve checkpatch.pl
> > for reporting this error type, or we decide to look at GIT_COMMIT_ID
> > errors, where I can quickly spot some false positives.
> > 
> > Best regards,
> > 
> > Lukas
> 
> Sir,
> 
> I analysed the given error type and my analysis can be found here:
> 
> https://github.com/eldraco19/evalute_improve_checkpatch_pl/blob/master/DIFF_IN_COMMIT_MSG.md
>

Evaluation looks sound. Although, I cannot really see the analysis of all 
10 commits. You say the 10 commits fall into two classes, but how can 
anyone else judge this from your report?

I also do not fully understand your conclusion; to me, it seems to 
contradict itself. Fortunately, I think your analysis suggests that there 
is not a clear improvement to checkpatch.pl, as far as I see.

So, I do not think that this is a good starting point for a change of 
checkpatch.pl.

I suggest that you look at the error type GIT_COMMIT_ID. I have found some 
cases that seem to be suitable for improvement of the checkpatch.pl 
script.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
