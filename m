Return-Path: <SRS0=xLm4=FU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9842C2BBCA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 12:57:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E8523339
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 12:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E8523339
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE42184A33;
	Wed, 16 Dec 2020 12:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4FBM1m02DpS; Wed, 16 Dec 2020 12:57:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09B7D847E5;
	Wed, 16 Dec 2020 12:57:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E60E4C088E;
	Wed, 16 Dec 2020 12:57:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70EAFC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4BF17227AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8BZXlQ72-b5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by silver.osuosl.org (Postfix) with ESMTPS id A5A222152E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:57:24 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id 2so22448531ilg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 04:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nBhCgN9+qmKMmfook1jEle7D+IS3xrqHz0nqjUQwToc=;
 b=ATC9vI+NS3X53MGRLSPuWu8TO/idRSh581jo7cptwH9uR8JWacHYdwPeIgToGHkUru
 u8M1HSjE+8QPqu6KvtYhvLoafSKs9Saojn5r8V4nq631gGcrxi/P3+8HRxVEtF/5BPuN
 AVrnBID0DWYwSMpuV6TUr5t0YQmIkV662Y5MFJlR687kyV6S9gqMSfcT0Ja1jph+ctlC
 Av455hLCRVopImbvaDc8mF1Xgl1WJ4+oavXUAIjurlh24Hh7gaswBsNterKl+sF7ASOG
 Krqoutf8JD8VQuDfo+n6M5+LmUGd2TIcX498nl3+FQN6nnKR7V+JcTyDzcAO+FAIf9+G
 TUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nBhCgN9+qmKMmfook1jEle7D+IS3xrqHz0nqjUQwToc=;
 b=iOgv55dYrjwRV5nsNznKDWTwFLliM8W9Mgu7ieVzYKvZGZE6dyQvyb5MRRai6vS4W1
 rCbPv8ShRKMURtv7dUgeUb4HiAwqIZAgzn7YyUTeDHHt5LwFGAxh15ZjaGBBcJQtT7IK
 TpULpAaL484G/ykv//aOfRcs4I75M+NMBQsuPcJQReaqbSrXvfOnXQmjJhnuWRz3uDjT
 G9th2/8XbiwVjwaKMXRmV3PKLFL3bPw6KK5LHtD25bCLMz33TNnGm+oLHYlTn85Mt0GP
 Q46Xce1Af2g6QiywH39T+48Nf/vpK9M8j/8TL7Rzq8Q/SdOW/KWwejvfut53b3AcoqA3
 XJcA==
X-Gm-Message-State: AOAM531BIbjwWN5wWs1lkj+ovcM8Cx2a2W0Wwqqw2ywRg+7rlyJuJGJa
 v6r07IDX7GGvWrTNlMLyFkDO6TPcxClzMiNNhKI=
X-Google-Smtp-Source: ABdhPJyK6teCIU3AXbbDiDOm2wdhNWOgn8io7cG66SyMhfOZfjZlnYUgzhrVhXFgje1QNQbK1AHZqTpgNcgLu+ZAD0w=
X-Received: by 2002:a92:d8cc:: with SMTP id l12mr44849345ilo.64.1608123443772; 
 Wed, 16 Dec 2020 04:57:23 -0800 (PST)
MIME-Version: 1.0
References: <20201216123121.16466-1-yashsri421@gmail.com>
 <CAKXUXMx+Jogibwf_WbC7RQ0jD2+uU=XvpF4JxSWtz+3C_bRWSg@mail.gmail.com>
 <53238abd-2fdc-e9fb-bef5-4b583ccb14e2@gmail.com>
In-Reply-To: <53238abd-2fdc-e9fb-bef5-4b583ccb14e2@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 16 Dec 2020 13:57:12 +0100
Message-ID: <CAKXUXMwo-xeYb9mHFXKN8j6BU9X7iNe68pkJ+zdGay7p+KxK7w@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for COMMIT_LOG_LONG_LINE with URLs
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

On Wed, Dec 16, 2020 at 1:54 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 16/12/20 6:05 pm, Lukas Bulwahn wrote:
> > On Wed, Dec 16, 2020 at 1:32 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently checkpatch warns for long line in commit messages even for
> >> URL lines.
> >>
> >> An evaluation over v4.13..v5.8 showed that out of ~11000 warnings for
> >> this class, around 790 are due to the line containing link.
> >>
> >> E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
> >> Consolidate how dtexts and dvalues are freed") reports this warning:
> >>
> >> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> >> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html
> >>
> >> Avoid giving users warning for character limit, instead suggest them to
> >> prefix the URLs with "Link:"
> >>
> >
> > Looks good to me. This might be also a good one for a fix option.
> >
>
> I agree. Should I add the fix in this patch itself?
>

No, make two patches and send them as a patch series to the mailing list.

Lukas

> Thanks
> Aditya
>
> > Lukas
> >
> >> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >> ---
> >>  scripts/checkpatch.pl | 10 ++++++++--
> >>  1 file changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >> index abd5a3d2e913..23da1f50fe6a 100755
> >> --- a/scripts/checkpatch.pl
> >> +++ b/scripts/checkpatch.pl
> >> @@ -3032,8 +3032,14 @@ sub process {
> >>                       $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
> >>                                         # A Fixes: or Link: line or signature tag line
> >>                       $commit_log_possible_stack_dump)) {
> >> -                       WARN("COMMIT_LOG_LONG_LINE",
> >> -                            "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> >> +                       if ($line =~ /(?:http|https|ftp):\/\//) {
> >> +                               WARN("COMMIT_LOG_LONG_LINE",
> >> +                                    "Consider prefixing the URL with 'Link:'\n" . $herecurr);
> >> +                       }
> >> +                       else {
> >> +                               WARN("COMMIT_LOG_LONG_LINE",
> >> +                                    "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> >> +                       }
> >>                         $commit_log_long_line = 1;
> >>                 }
> >>
> >> --
> >> 2.17.1
> >>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
