Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE91C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 15:41:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42CEE21741
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 15:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbxU1b6h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42CEE21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBAEA87352;
	Fri, 25 Sep 2020 15:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NymIZc+sHbr; Fri, 25 Sep 2020 15:41:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49F098725E;
	Fri, 25 Sep 2020 15:41:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EB91C0859;
	Fri, 25 Sep 2020 15:41:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45D2EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 15:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B9B087352
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 15:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4VsMmouSvzo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 15:41:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DBF988725E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 15:41:20 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id j11so4291063ejk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 08:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=SkM/0CaoF4jgHkUycdC1p9eWz3MKpihIu/B7DRpJsP4=;
 b=FbxU1b6h8gTfRnvYs+Vx5unhV834KXBjB/zejSu5DOHGqKbUt3GDXOX85PDZICwDXG
 EHv2gt3E3t35kgQvyt6HZ6IuZX0aKfkAZhpDDz7IS0f5WKNC4VgcxchJ7np2yuJ3B0MW
 HjA1KkMO6v9ntzzMxuGeYam532HgmK3Igx9ogy2XkXHjsZcgQeuU6ip/ckki0TMO+EZD
 tGtaPCwebUnbv7H4u57fFLb78E4jv6IgW1u+MFgDEf55cxyoqbztD/ZtVjWeLjGLlPWk
 U0oGfw2NXOL5aIsUXAYlvgnGmXjxyl3ci++uEwstkBO/LYSplM/TNveeo4FHrpp4nFPD
 l/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=SkM/0CaoF4jgHkUycdC1p9eWz3MKpihIu/B7DRpJsP4=;
 b=ibQyVyr2flS6nNAkyJbCSYaPfJ72nvSacIR4At5XQMQFhr9e5dDSI1iOwR09UFfzcn
 MgwmUPrKufp/pM5/3weyl0rPWW+xR5hVTdYksr/rRvzvElMsdHLXil9ONRhV/FESmGtR
 jolXK3bfIPr2HnhKrDhlIUxBBFm9NhYkxhAu+OkLyaPcGmNWEvWtXIsFEv+vsqKRtKpG
 iIkXVysPQmaB6KaH8jMTyWpFglXfL+BQfIg7Nvk40+Suip5gU99W8cfBBj2oB+DD5w73
 K2AyuNKawEOINAV2vHg6lXzcLfd27irc6P8psjB5hhk7FI6tWLtPoEJ3ruE+61J5JY0B
 f2mw==
X-Gm-Message-State: AOAM530Ph/wd1EpbgkYv+C5pfMNvvU+/+xXB4bJc9lIIrcllZVyqQizl
 vTsSrZ895vyWO0yYltZI5rw=
X-Google-Smtp-Source: ABdhPJz5HSZVzzvDdrs8urvtJ0NSeI3eym46Jyr72Og0FVpHjPu/VF5+z6T5uGXvrr/YOLMAR8JKKA==
X-Received: by 2002:a17:906:af6a:: with SMTP id
 os10mr3307293ejb.34.1601048479237; 
 Fri, 25 Sep 2020 08:41:19 -0700 (PDT)
Received: from felia ([2001:16b8:2dc8:d00:2dda:437:1f8b:d615])
 by smtp.gmail.com with ESMTPSA id jo2sm2056506ejb.101.2020.09.25.08.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 08:41:18 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 25 Sep 2020 17:41:12 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <3aa27e51-1b49-d0ad-3995-3a9185393847@gmail.com>
Message-ID: <alpine.DEB.2.21.2009251736180.27889@felia>
References: <4e69c59d-2daf-e63a-bf83-75fbcd105b62@gmail.com>
 <alpine.DEB.2.21.2009241906520.16272@felia>
 <3aa27e51-1b49-d0ad-3995-3a9185393847@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation for
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



On Fri, 25 Sep 2020, Ujjwal Kumar wrote:

> On 24/09/20 10:56 pm, Lukas Bulwahn wrote:
> > 
> > 
> > On Wed, 23 Sep 2020, Ujjwal Kumar wrote:
> > 
> >> Hi Lukas,
> >>
> >> I looked at different error messages and came-up with a list of
> >> possible false positives reports by checkpatch script.
> >>
> >> First, is about BAD_SIGN_OFF warning for Duplicate signature.
> >> Though it is obvious to have these warnings but I am wondering 
> >> about situations where there is some other signature between 
> >> two exactly same signatures.
> >> For instance,
> >>
> >> commit 3f9c6d38797e9903937b007a341dad0c251765d6
> >>     ...
> >>     Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >>     Acked-by: Andrew F. Davis <afd@ti.com>
> >>     Cc: <Stable@vger.kernel.org>
> >>     Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >>
> >> commit 79ea1e12c0b8540100e89b32afb9f0e6503fad35
> >>     ...
> >>     Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> >>     Link: https://lore.kernel.org/r/20200604120420.b1dc540a7e26.I55
> >> dcca56bb5bdc5d7ad66a36a0b42afd7034d8be@changeid
> >>     Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> >>     
> >> I'm not familiar how/when these situations can occur. But if these 
> >> scenarios are commonly acceptable then the script should not report
> >>  a warning for duplicate signatures.
> >>
> > 
> > That is a typical situation when a maintainer sends their own patches to a 
> > mailing list and then picks them up again. Hmm, I need to think about if 
> > that should be addressed. You could of course detect the Link: 
> > with lore.kernel.org and identify that all further sign offs are now part 
> > of the patch integration. Running checkpatch.pl on git commits is not the
> > most common thing, so it might just be a minor issue.
> > 
> > Let us keep it in mind for now.
> > 
> >> ---
> >>
> >> Second, is about WHILE_AFTER_BRACE errors.
> >>
> >> Example commit: 6f8a57ccf8511724e6f48d732cb2940889789ab2
> >>
> >> The error message suggests to move the empty while loop with close 
> >> brace of an if block which is not recommended according to the code 
> >> style.
> >>
> >> The possible correction would be consider checking the type of 
> >> block that is ending and report only when the do block is found.
> >>
> > 
> > Okay, that is going to be tricky... maybe clang-format and friends is the 
> > better tool to handle that eventually. I would not pick that to 
> > investigate further, just because it is quite tricky. checkpatch.pl is 
> > already just doing some rough estimation and not really parsing the syntax 
> > tree.
> >> ---
> >>
> >> Third, is about EXECUTE_PERMISSIONS errors where the script reports 
> >> an error for a python (possible with others scripts as well) script 
> >> with file mode set as '100755' but file name does not include '.py' 
> >> extension and is not present under the 'scripts' directory tree.
> >>
> >> So, a python script file named 'binfmt_script' with file mode '100755'
> >>  is erroneously reported by the script as:
> >>
> >> ERROR:EXECUTE_PERMISSIONS: do not set execute permissions for source files
> >> #39: FILE: tools/testing/selftests/exec/binfmt_script
> >>
> >> even when it is okay to make the script file executable.
> >>
> >> Example commit b081320f0693cce0394f7c8bad9fba0b25982186
> >>
> >> A possible solution to this would be to use the script's first line 
> >> for determining whether the file is a executable file or not.
> >>
> > 
> > That seems reasonable. Maybe the rule needs an update anyway because 
> > executable scripts can also be in tools/...
> > 
> > I suggest to have a look at the discussion of this patch where we already 
> > discussed out the role of execute permissions in the kernel repository:
> > 
> > https://lore.kernel.org/linux-kernel-mentees/20200827060523.6fi34tcrg5xndzuu@mrinalpandey/#t
> > 
> > Mrinal never followed up on the two potential tasks in
> > https://lore.kernel.org/linux-kernel-mentees/alpine.DEB.2.21.2008310714560.8556@felia/
> > 
> > Ujjwal, maybe you can look at the build scripts and check if there are any 
> > places where the build really relies on the file being executable (which 
> > we currently do guarantee)?
> > 
> 
> I unset executable bit on all the files, and tried building the kernel.
> The configuration step itself fails and hence it appears that build process 
> and Makefiles do rely on the executable bits for scripts.
> 
> The init/Kconfig file is the reason behind failing builds. I prefixed the 
> script calls with relevant interpreters and now I can successfully 
> configure and build the kernel. Though I have not tried building all the 
> modules (only the ones relevant to my system configuration). I'll be able 
> to give a final opinion after making all the modules (my system is too slow
> with a dual core cpu :( ).
>

If you can share the commands you executed and the patches we need to 
apply, we can apply them and test with further configs and further cores.

Maybe, it is also good just to grep for locations where the Makefile 
introduces new build targets; I think that is only a few places in 
prominent locations. Most of the Makefiles just name files and hook them 
into the normal CC build, adopt compiler warning settings, but do not 
invoke any further special commands.

We are all looking forward to your fixes of the build Makefiles.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
