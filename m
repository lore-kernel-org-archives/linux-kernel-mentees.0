Return-Path: <SRS0=oxYf=GL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B05C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 15:09:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FC22388B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jan 2021 15:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0FC22388B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4236F86DE7;
	Fri,  8 Jan 2021 15:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMaGkKsPOsIm; Fri,  8 Jan 2021 15:09:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C31380C0A;
	Fri,  8 Jan 2021 15:09:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80327C0891;
	Fri,  8 Jan 2021 15:09:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90727C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 15:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 72C2E87591
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 15:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZpKTImYgSrSQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 15:09:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8F56387585
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jan 2021 15:09:07 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id n7so7831847pgg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 08 Jan 2021 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x+CQx6M6QBjSajynbU+dY12gvQvvI5KURSWqAjDcqxA=;
 b=foRdu+SA5dUeYkTwDnPIvEyrPwPWqeFqUd/hnH1eT5Q9DZG2Y7viZB0FHQ3N/75Wq7
 /SkVh82+5AqV4wqRnMtVY751yLbx/7cDHLp/M/SjmMeiJuDm+EHYznAOs88zgmuvoc4m
 xR6tW9qUR781lLlaz66RX3IIgIdux6kuforqWdvBv5wkuVm4tpIY1mxCxEHA6Q5SljBL
 fXDl87zVTL0sZ+rE4liGpVn5XYO8+yuD7w9EhUwskobqdiy92xXSf7vQMNguGrlRQ1AV
 fxlF0X6GG1DViNDN9wjDuYNaUnZm/urfXWNwBgmpV0J3g57REzVbfh+R917IV0rtbobL
 mS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x+CQx6M6QBjSajynbU+dY12gvQvvI5KURSWqAjDcqxA=;
 b=TeBByKG6tbjU5qO4IpcRRwx5hsM+aWRHs7Pd3o3uEGGw/6kQW45TQVeaMVJmTvj0j8
 nkhk6wxwaELVtzDCwjxVOt1gM7g+Ki4+GgrWa7QfpgGoouzgokQOSqYq9wFRzRaOjxib
 fKUxFYFYIRKX57n/Y9PY6IVauA6KHQ92IU6RF93lwNgtjof26+SX8RPYAo4Ra5WW1RT/
 wkU2tVdwdbIhMZ60xueHRBOI7rmfaDPpBQ1wEL6g+/kGxO4J5z2PdedVvgltCQRI2KO5
 FzhG1w6hA6xzuP74gKFI4SO5ERQYg5tqsJInXSJdz4bO0g2vnRFDxTXNwbbCSWONjGnW
 MHaA==
X-Gm-Message-State: AOAM533sTL3Z6+z0dDgMSJroZgGRod+4h/J5EQZIy4tlp85TDCgMmmbi
 rnkSnD/4WAau8ZYPCzHkq5dIoddqKR5avA==
X-Google-Smtp-Source: ABdhPJxtazAFo7Df0JD4UR2xZaWAFss6OCg9i/zihLZNUbDNni6B4CEyq48EHNszRXkOLVreIksq+w==
X-Received: by 2002:a63:5023:: with SMTP id e35mr7500564pgb.56.1610118546519; 
 Fri, 08 Jan 2021 07:09:06 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:9d25:60e2:6f4:74f8?
 ([2405:201:600d:a089:9d25:60e2:6f4:74f8])
 by smtp.gmail.com with ESMTPSA id x7sm10236719pga.0.2021.01.08.07.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 07:09:05 -0800 (PST)
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20210104132536.38016-1-dwaipayanray1@gmail.com>
 <CAKXUXMxFRU=1V+dRGX8MkK329VoSH_gUVDOxscwh1K4OeQhs=w@mail.gmail.com>
 <CABJPP5AzpXD7Okx5m3J01aY27xBJm6-Ax4Zn9zOD4=AB217epA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <9720245f-d2e1-d95b-a78e-a68ffeab6106@gmail.com>
Date: Fri, 8 Jan 2021 20:39:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABJPP5AzpXD7Okx5m3J01aY27xBJm6-Ax4Zn9zOD4=AB217epA@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: trivial style fixes
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

On 5/1/21 2:11 pm, Dwaipayan Ray wrote:
> On Tue, Jan 5, 2021 at 1:34 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>>
>> On Mon, Jan 4, 2021 at 2:25 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>>
>>> Indentations should use tabs wherever possible.
>>> Replace spaces by tabs for indents.
>>>
>>> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>>
>> Looks good.
>>
>> Find out who is to blame for this stylistic mess up. (use git blame).
>>
>> If it is Aditya, let him know to check better and how you discovered
>> this mess-up.
>>
> 
> I think some of Aditya's earlier patches caused this. I was idly running the
> regex "^[ ]+" on files which detected these misuses. Probably it's a
> broken editor
> which expanded tabs, maybe vim with exandtab set. Aditya could you verify your
> editor config? Thanks.
> 

Yes, this problem was there with my earlier setup, probably because of
configured tab size and word wrap. I think my current flow works better.

Thanks
Aditya

> Thank you,
> Dwaipayan.
> 
>>
>> Lukas
>>
>>> ---
>>>  scripts/checkpatch.pl | 18 +++++++++---------
>>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index b212f5f12ca6..d6a4d25b0972 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -2973,7 +2973,7 @@ sub process {
>>>                                 }
>>>                                 if (!defined $lines[$linenr]) {
>>>                                         WARN("BAD_SIGN_OFF",
>>> -                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
>>> +                                            "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
>>>                                 } elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
>>>                                         WARN("BAD_SIGN_OFF",
>>>                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
>>> @@ -2996,8 +2996,8 @@ sub process {
>>>                         if (ERROR("GERRIT_CHANGE_ID",
>>>                                   "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
>>>                             $fix) {
>>> -                                fix_delete_line($fixlinenr, $rawline);
>>> -                        }
>>> +                               fix_delete_line($fixlinenr, $rawline);
>>> +                       }
>>>                 }
>>>
>>>  # Check if the commit log is in a possible stack dump
>>> @@ -3239,10 +3239,10 @@ sub process {
>>>                                 next if ($start_char =~ /^\S$/);
>>>                                 next if (index(" \t.,;?!", $end_char) == -1);
>>>
>>> -                                # avoid repeating hex occurrences like 'ff ff fe 09 ...'
>>> -                                if ($first =~ /\b[0-9a-f]{2,}\b/i) {
>>> -                                        next if (!exists($allow_repeated_words{lc($first)}));
>>> -                                }
>>> +                               # avoid repeating hex occurrences like 'ff ff fe 09 ...'
>>> +                               if ($first =~ /\b[0-9a-f]{2,}\b/i) {
>>> +                                       next if (!exists($allow_repeated_words{lc($first)}));
>>> +                               }
>>>
>>>                                 if (WARN("REPEATED_WORD",
>>>                                          "Possible repeated word: '$first'\n" . $herecurr) &&
>>> @@ -4426,7 +4426,7 @@ sub process {
>>>                         WARN("STATIC_CONST_CHAR_ARRAY",
>>>                              "char * array declaration might be better as static const\n" .
>>>                                 $herecurr);
>>> -               }
>>> +               }
>>>
>>>  # check for sizeof(foo)/sizeof(foo[0]) that could be ARRAY_SIZE(foo)
>>>                 if ($line =~ m@\bsizeof\s*\(\s*($Lval)\s*\)@) {
>>> @@ -5279,7 +5279,7 @@ sub process {
>>>                     $lines[$linenr - 3] !~ /^[ +]\s*$Ident\s*:/) {
>>>                         WARN("RETURN_VOID",
>>>                              "void function return statements are not generally useful\n" . $hereprev);
>>> -               }
>>> +               }
>>>
>>>  # if statements using unnecessary parentheses - ie: if ((foo == bar))
>>>                 if ($perl_version_ok &&
>>> --
>>> 2.27.0
>>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
