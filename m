Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E333C388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 07:22:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 946D920719
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 07:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ulBDaYYs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 946D920719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2CBEB869CA;
	Sun,  8 Nov 2020 07:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tD6uu3+NIY0k; Sun,  8 Nov 2020 07:22:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E2FA86945;
	Sun,  8 Nov 2020 07:22:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60217C088B;
	Sun,  8 Nov 2020 07:22:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D89EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 07:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 122198695C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 07:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqkAOKqSe9em
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 07:22:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A73E386945
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 07:22:12 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e18so5429160edy.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 23:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=BfHwYfY5VnuooQhP66qBo04+XSDWTRy10DAdACBI24A=;
 b=ulBDaYYseNGiGnTjck/ei/5t9+KQWFDy8JOsD1Oj+dw6TOoV4VDSGpFpSNDyu1P7M2
 AWpXLZ5MCCIqwW2oUcZd7M307A2AQrZnstZ41MULnXVdnRP5/7yRPh4qo1NjvbluWyzo
 PaIwj4G1XBRonQA9PwocPNex5FpnrW+BCa55YUfvICUlgqTW5oGHVjcmnIKLJjyLVNHT
 ninvyOH9YdScr7XoYbjsvQXxUUlQAAJTuZ8vPfCceIoUULOi5BOVmsqal+S6xCFB6fmt
 sQSSanxEHzQUWHmyajpwj5zibLCsPMKsYO4gG8zGhYvfc08Q8Ppteh41hqyxxIkyo4Gd
 Jozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=BfHwYfY5VnuooQhP66qBo04+XSDWTRy10DAdACBI24A=;
 b=Li+exob+qBo0VNtjdEUegzRZjj2byczgwg0k9bjmKXS+UjjuPZ08XiNnPSGoECj3AF
 UEu2oAV/lFOWRvhGBCfFb8/AZ08X4TTt1EHyEjsZDE7fVUSSq0JgyHI7y2+CZOxTYzfu
 u2997DNNbX7hYTOUWXhA7yDOZhm4vU1qfncGYNO3kpe67Pr9T1A/n1TPNxr+9A34YLFv
 X6SscQPcqrnUGTtdOMVtHvSvMe5Y4t+cJTyASM7X7vA4dwSO8XAWC+agNa0NxEa/hC+d
 wARCAgmJIorPmpAK/VPPTsJM2Lhuh+iKuKZrDjZM2xqjxsUutfoxuslykWlZ9pB1mAuG
 fUUA==
X-Gm-Message-State: AOAM531UKnT9YA0VoGBeVvZ162SC1nDBcbNJdYVLAu4V6xgNJdlw63RT
 t395h5reU00HhkNPLbUypos=
X-Google-Smtp-Source: ABdhPJxuEZWasG+SvxWUYYsX0ZcjoFonqCS/eLFfiTSMCMqLc6sELgwwoJOhjBkqp0C/PBUMmmYEyA==
X-Received: by 2002:a50:9e05:: with SMTP id z5mr9506154ede.231.1604820130909; 
 Sat, 07 Nov 2020 23:22:10 -0800 (PST)
Received: from felia ([2001:16b8:2d34:bd00:5df6:61b:5ed6:df51])
 by smtp.gmail.com with ESMTPSA id j9sm5200919ejf.105.2020.11.07.23.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 23:22:10 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 8 Nov 2020 08:22:08 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <96a7795a-1a95-b1d7-3faa-113fb8c7d048@gmail.com>
Message-ID: <alpine.DEB.2.21.2011080748070.4909@felia>
References: <20201107121742.27144-1-yashsri421@gmail.com>
 <2837bf55-4bab-ffcc-843c-318c7de26ff4@gmail.com>
 <CAKXUXMxix-9oWtpbS1kAK+PY7hsNuKs7_z3GDvDyJHRadSZYNw@mail.gmail.com>
 <96a7795a-1a95-b1d7-3faa-113fb8c7d048@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for COMMIT_LOG_LONG_LINE
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



On Sun, 8 Nov 2020, Aditya wrote:

> On 8/11/20 12:13 am, Lukas Bulwahn wrote:
> > On Sa., 7. Nov. 2020 at 15:49, Aditya <yashsri421@gmail.com> wrote:
> > 
> >> On 7/11/20 5:47 pm, Aditya Srivastava wrote:
> >>> Currently, when a line exceeds 75 characters in a commit message,
> >>> checkpatch.pl gives a warning corresponding to the same.
> >>>
> >>> E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
> >>> for some cards having 0 maximum voltage") we get this warning:
> >>>
> >>> WARNING: Possible unwrapped commit description (prefer a maximum 75
> >>> chars per line)
> >>>
> >>> Some, mostly Fermi, vbioses appear to have zero max voltage. That causes
> >> Nouveau to not parse voltage entries, thus users not being able to set
> >> higher clocks.
> >>>
> >>> Provide a fix by consuming first 70 chars of the corresponding line,
> >>> then stop at the next whitespace, and substitute it with the consumed
> >>> chars and a newline char.
> >>>
> >>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >>> ---
> >>>  scripts/checkpatch.pl | 7 +++++--
> >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >>> index 5a1096a4e220..ee665208ef02 100755
> >>> --- a/scripts/checkpatch.pl
> >>> +++ b/scripts/checkpatch.pl
> >>> @@ -2881,8 +2881,11 @@ sub process {
> >>>                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >>>                                       # A Fixes: or Link: line
> >>>                     $commit_log_possible_stack_dump)) {
> >>> -                     WARN("COMMIT_LOG_LONG_LINE",
> >>> -                          "Possible unwrapped commit description
> >> (prefer a maximum 75 chars per line)\n" . $herecurr);
> >>> +                     if (WARN("COMMIT_LOG_LONG_LINE",
> >>> +                              "Possible unwrapped commit description
> >> (prefer a maximum 75 chars per line)\n" . $herecurr) &&
> >>> +                         $fix) {
> >>> +                             $fixed[$fixlinenr] =~
> >> s/(.{70}[^\s]*)\s+/$1\n/g;
> >>> +                     }
> >>>                       $commit_log_long_line = 1;
> >>>               }
> >>>
> >>>
> >>
> > 
> > Why do you not implement a proper word wrap function?
> > 
> 
> Actually, I had searched on the web regarding it before implementation.
> Here I have implemented text wrap only and regex is the best way I
> could find of implementing it. Also the same was advised at
> stackoverflow. I took help from the same.
> Link:
> https://stackoverflow.com/questions/956379/how-can-i-word-wrap-a-string-in-perl

And stackoverflow is not always a good reference.

> Apart from it, perl also provides a wrap function using module
> Text::Wrap, but I wasn't sure if I could use this module in my
> changes. So, I proceeded with regex.
>

You can look into that, understand it a bit and then just implement a word 
wrap from scratch as we would need it here in checkpatch.pl, it should not 
be that complicated. 
 
> > A single commit tells us very little if this rule in checkpatch.pl really
> > is a good rule or not. A proper evaluation of typical cases of long commit
> > lines would help much more to improve this rule.
> > 
> 
> I generated a list of commit_long_long_line warnings with the line for
> which they are occurring at:(v4.13..v5.8)
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task6/summary.txt
> 
> As I could see, most of these messages are plain english. But there
> are few instances of links, hex, file locations, such as:
>

I see many false positive warnings; so most are cases where I would not 
break the line.

> 1)https://lore.kernel.org/lkml/1559767582-11081-1-git-send-email-info@metux.net/
> 

How about detecting all likely URLs and suggesting a proper Link: tag in 
front of them?

> 2)  /home6/tmricht/linux-next/tools/build/Makefile.build:96: recipe
> for target 'libbpf.o' failed
> 
> 3)	8b 35 7b fb e2 00	mov    0xe2fb7b(%rip),%esi # ffffffff82db9e64
> <nr_cpu_ids>
> 
> I think we can use a better regex like:
> s/(.{1,75}|\S{76,})(?:\s[^\S\r\n]*|\Z)/$1\n/g
> 
> I tested this regex with the above cases, in which
> 1) remains unaffected
> 2) gets wrapped at "..recipe for" (which is 69 chars in length)
> 3) gets wrapped at "# ffffffff82db9e64", which is 64 in length
> 
> I guess I can generate another file with how these lines will be
> changed, when used with fix option.
> What do you think?
>

I think 1, 2 and 3 should not be wrapped.

1) should be fixed by adding a Link: prefix.
2) should be warned to just drop the absolute path or so.
2) and 3) need to detected to be tool output and hence, we accept a longer 
line limit here.

I also see a few tags and long commit log warnings.

Does checkpatch.pl also warn on long tags? That should be excluded from 
that check.

Also, I noticed quite a few 'References: <git-sha> ("<git commit 
message>")'. I think there is no standard for this yet, but maybe that is 
worth a discussion to agree on something and then add documentation and a 
check for that.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
