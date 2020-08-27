Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B898EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 05:29:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F72F20786
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 05:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMkuAM84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F72F20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3604220408;
	Thu, 27 Aug 2020 05:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRQvybszSvgp; Thu, 27 Aug 2020 05:29:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CAA4F20405;
	Thu, 27 Aug 2020 05:29:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4695C0890;
	Thu, 27 Aug 2020 05:29:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F26CDC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 05:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DB12D86928
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 05:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIVqhiv6XNQM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 05:29:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D78658688B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 05:29:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id o4so4081490wrn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Aug 2020 22:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=bJYyzP6z6/ioUP/D/vJ6aBQOdctg7T6P7Y0MoUfLEag=;
 b=aMkuAM84Es4iSIQs6RY58OaPLwLCP4kph+vFGYkwsyY34OaXrTY93GSdQz6O6JHHif
 CB3QYHeOKxdHjyOIBi+E8nLb5B+doHxwahI/WUIq7AvjO+f8yBvkq8R8zXDHHddH0TVb
 Yhb367VGxXPj5/uqjOmFoCg/nuHAYCcc8wRzc1f4EpklrOuIKEEJMPWFAQEemjKeMlk5
 fKJw7/k6eCnJsdunkwhpoTJWqQdXa9srXL8H6gCsbxEGvgoCzYU6GlB+aFrtaldIpIyn
 ebXmID7Hi4dEjWV6UgSBYTnQY4lE1dVZfMaMjK5/7mOX2m2uLrgNwkD+IJ+1Ux99JLzJ
 E1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=bJYyzP6z6/ioUP/D/vJ6aBQOdctg7T6P7Y0MoUfLEag=;
 b=WXbgQ4G+U+DuoeHt0+H/Y/W+232WjtF/o4qw1CBHpw8+8DMEuQ8ALqFsBc6eoDYGsX
 5m4/QUGasUxeAq1bFF9gdBjASVovPhYJfnYWp90iWMg8uCGa8MCajFINTuC2ny4CPvak
 UAuIdz7k2Qpg7xVTcMcck8PcdqrRqnOuJaj55zwDl9I74GSpDxpzYVomglX9Ep5JhUrW
 VWQZo1Eg/BlsEx+IN4teT0Zyn7AqBTuFpQMra+xBPQdNt+lsaTYnD9rkuSxLZQYgHxCp
 fATV8GyGbjjJ2s0eK5uEo/Tz4utLJaXlwUTYF74s/KzYrWXv18kd3/XYMBPm+8YXTtO0
 Qnmw==
X-Gm-Message-State: AOAM530IZeEX2dj7iFYiCAwvmDEJVsJ04MnknBrJxS6FQoCKCag4AeF2
 jOYRKjtnUvUYQl8hnMg0IU0=
X-Google-Smtp-Source: ABdhPJwZ9SyLTs8LopmaVJED2g5qpq3l/hzwzA4aXRGi8sX6Lk7IbMz3Ig/e08/PDVlvqep6XJryVw==
X-Received: by 2002:adf:9387:: with SMTP id 7mr1913730wrp.332.1598506144168;
 Wed, 26 Aug 2020 22:29:04 -0700 (PDT)
Received: from felia ([2001:16b8:2d0c:fc00:340b:71b8:4541:aa75])
 by smtp.gmail.com with ESMTPSA id f125sm2430993wmf.48.2020.08.26.22.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 22:29:03 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 27 Aug 2020 07:28:56 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <32595de077ee7d674a628df11c58152f@disroot.org>
Message-ID: <alpine.DEB.2.21.2008270707440.9436@felia>
References: <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
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



On Mon, 24 Aug 2020, Ayush wrote:

> August 22, 2020 1:36 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
> 
> > On Fri, 21 Aug 2020, Ayush wrote:
> > 
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
> > 
> > So far, so good.
> > 
> > Here are the questions we want to answer:
> > 
> > - So what are the 20 categories that occur most?
> > 
> > You are getting close to that answer, but you are not there yet.
> > 
> > Then look at the findings. For those 20 categories, are there specific
> > findings that are multiple times false positives?
> > 
> > So, the script complains about something, but it does not get that the
> > patch author wrote something completely unrelated to the error message.
> > 
> > Lukas
> 
> Sir,
> 
> I tried the given tasks and it can be found here,
> 
> https://github.com/eldraco19/evalute_improve_checkpatch_pl/blob/master/STATS.md
>

The solution is implemented a bit complicated, but well, at least, it 
works if I believe your report. (I only read the code, but did not run 
it.)

The goal now is to find a class of false positives and improve 
checkpatch.pl accordingly.

I suggest that you look at the specific DIFF_IN_COMMIT_MSG reported 
errors?

Provide a short assessment for each DIFF_IN_COMMIT_MSG error in the 
10 commits.

It should tell:
  - what lines in the commit message did checkpatch.pl complain about?
  - what is the pattern in the commit message?
  - does patch(1) really stumble over that pattern?
  - how would this pattern need to be provided to patch(1) so that it 
would stumble over it?
  - if no, why not?
  - can we change checkpatch.pl to not raise an error for such a 
situation? So, only raise an error when the pattern would really make 
patch stumble on it?

Depending on the evaluation, we might continue to improve checkpatch.pl 
for reporting this error type, or we decide to look at GIT_COMMIT_ID 
errors, where I can quickly spot some false positives.

Best regards,

Lukas

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
