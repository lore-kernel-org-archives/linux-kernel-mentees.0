Return-Path: <SRS0=ZryW=FM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9430EC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Dec 2020 17:44:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223C623B31
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Dec 2020 17:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223C623B31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 883D28698D;
	Tue,  8 Dec 2020 17:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ih9LjY-plXTF; Tue,  8 Dec 2020 17:44:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C99C08688C;
	Tue,  8 Dec 2020 17:44:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC04EC0FA7;
	Tue,  8 Dec 2020 17:44:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE409C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 17:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BD86E8698D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 17:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJJzsWbK7maP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 17:44:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F154B8693F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 17:44:31 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t37so12826100pga.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Dec 2020 09:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AgI0PGd+IaNkxgbiJUkZjXuOL3fk42jfPUUnTz22xqQ=;
 b=Z7xkXs8Bmj+oyLUaGhUPkAcmwXlS9K7+f+FxQgWAXfY1PPlPaZ7BiG6NFrxRmJfTZr
 /oB8rq4qnpSdPdNCeA98lDFmGMjiQAcX1H+Fy6vx7rsbcjyCgK0HlEXsnY/BJF/bCOBh
 P/41jusx/4MCBo9BeplrKqja09g3EnTpLBwRpiOINdl/G7KjpvaCwgXEAyThZehvslWM
 TGMbZA5J44QyhYm7OhRN0leLp+PJKp3f0AWfGa6HUdRgL2oiLvBsdGRXiL+m8kBtJEOC
 m5fBPIgvngjKxT15958WxGpVT2HlTJOhn9QaHLTXNnm3cg8hB1olYZKE6X1Hmdxkwru4
 IyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AgI0PGd+IaNkxgbiJUkZjXuOL3fk42jfPUUnTz22xqQ=;
 b=hUoh779Ryk0gKNABySlbajmwIB60UwVonA05S5PcyeSp5DJ9s4yhSiAdW5EEze1qRD
 xYI9QH7+fY4IfipBttHlmWQGSGtGJgeoTe9jBSKQWwqnHi8WFqTpcvFg/XcgTTYtE6YM
 HbHPFBAhEF5LQXl4JiW7S2I6OmJ05GgC+xaflrNO0+rHiRdqCVg1RckI37Tym4PSGOGO
 XQaizxHPZT+4m8RI9XUpuFf5ofTc6C72d5LHAVZ5Liw505BOuwhjOHQKQwHsR0uF6PLM
 CM8xNHs7VCJyJjjN3JCPJnMuhQXZdvpmKRkjyJYAXZSOglWDlzB0r8XEl9I9e5551hzm
 J1dA==
X-Gm-Message-State: AOAM530P6YY3QtTvddriFVkOeOuknVesKCn3wq5pWtTl6uKZPPRNJxV1
 OPlSMwfEbL2ocYt3polMEN1W+uc0RsqUrg==
X-Google-Smtp-Source: ABdhPJyk4jKHjGxgLPq5l3FwJXUnzKMkJhNdb4yzzRB0aCaGH5QTVm7Xc+AR0MaGY58ucLhNfEpLIg==
X-Received: by 2002:a63:931a:: with SMTP id b26mr5990494pge.55.1607449470992; 
 Tue, 08 Dec 2020 09:44:30 -0800 (PST)
Received: from ?IPv6:2402:3a80:409:eab8:d9f9:133a:8ce7:6fdc?
 ([2402:3a80:409:eab8:d9f9:133a:8ce7:6fdc])
 by smtp.gmail.com with ESMTPSA id j69sm18639227pfd.37.2020.12.08.09.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 09:44:30 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201202183649.9773-1-yashsri421@gmail.com>
 <540be894-a369-160f-25cc-a22a06612c9f@gmail.com>
 <CAKXUXMyhw4rKNesshCdHT+mLJ9PEkA+ZJO7bFXZciNFDZKHtBA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <9ee46b5d-d849-cd6c-39f4-11e6850edbd6@gmail.com>
Date: Tue, 8 Dec 2020 23:14:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyhw4rKNesshCdHT+mLJ9PEkA+ZJO7bFXZciNFDZKHtBA@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	BAD_SIGN_OFF
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

On 8/12/20 10:24 pm, Lukas Bulwahn wrote:
> On Tue, Dec 8, 2020 at 5:44 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 3/12/20 12:06 am, Aditya Srivastava wrote:
>>> Currently checkpatch warns us if the Co-developed-by line for an author
>>> isn't immediately followed by the Signed-off-by line.
>>>
>>> Generally, this warning occurs because of:
>>> 1) Absence of Signed-off-by line for the author from the patch
>>> 2) Misplaced Signed-off-by line for the author in the patch
>>>
>>> Provide a simple fix by:
>>> 1) Inserting Signed-off-by line for the author immediately after the
>>> Co-developed-by line
>>>
>>> 2) Removing Signed-off-by line for the author (if it pre-existed on
>>> some other line)
>>>
>>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>>  scripts/checkpatch.pl | 28 ++++++++++++++++++++++++----
>>>  1 file changed, 24 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index 5c9f13a97c12..d8f9d4d8b13d 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -2509,6 +2509,9 @@ sub process {
>>>       my @setup_docs = ();
>>>       my $setup_docs = 0;
>>>
>>> +     my %signed_off_by_lines;
>>> +     my %co_developed_by_lines;
>>> +
>>>       my $camelcase_file_seeded = 0;
>>>
>>>       my $checklicenseline = 1;
>>> @@ -2794,6 +2797,7 @@ sub process {
>>>                                       my $ctx = $1;
>>>                                       my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
>>>                                       my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
>>> +                                     $signed_off_by_lines{$ctx} = $fixlinenr;
>>>
>>>                                       if ($email_address eq $author_address && $email_name eq $author_name) {
>>>                                               $author_sob = $ctx;
>>> @@ -2989,11 +2993,17 @@ sub process {
>>>                                       }
>>>                               }
>>>                               if (!defined $lines[$linenr]) {
>>> -                                     WARN("BAD_SIGN_OFF",
>>> -                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
>>> +                                     if (WARN("BAD_SIGN_OFF",
>>> +                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline) &&
>>> +                                         $fix) {
>>> +                                             $co_developed_by_lines{$email} = $fixlinenr;
>>> +                                     }
>>>                               } elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
>>> -                                     WARN("BAD_SIGN_OFF",
>>> -                                          "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
>>> +                                     if (WARN("BAD_SIGN_OFF",
>>> +                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]) &&
>>> +                                         $fix) {
>>> +                                             $co_developed_by_lines{$email} = $fixlinenr;
>>> +                                     }
>>>                               } elsif ($1 ne $email) {
>>>                                       WARN("BAD_SIGN_OFF",
>>>                                            "Co-developed-by and Signed-off-by: name/email do not match \n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
>>> @@ -7203,6 +7213,16 @@ sub process {
>>>               ERROR("NOT_UNIFIED_DIFF",
>>>                     "Does not appear to be a unified-diff format patch\n");
>>>       }
>>> +
>>> +     if (%co_developed_by_lines) {
>>> +             foreach my $co_developer (keys %co_developed_by_lines) {
>>> +                     if (exists($signed_off_by_lines{$co_developer})) {
>>> +                             fix_delete_line($signed_off_by_lines{$co_developer}, "Signed-off-by: $co_developer");
>>> +                     }
>>> +                     fix_insert_line($co_developed_by_lines{$co_developer} + 1, "Signed-off-by: $co_developer");
>>> +             }
>>> +     }
>>> +
>>>       if ($is_patch && $has_commit_log && $chk_signoff) {
>>>               if ($signoff == 0) {
>>>                       ERROR("MISSING_SIGN_OFF",
>>>
>>
> 
> Not a big fan of that. Especially because adding and removing
> Signed-off-by: from a trail has a specific meaning.
> 
> So that fix can only be applied under very specific conditions. You
> cannot just sign a document in the name of another person, that is
> clearly fraud and identity theft.
> 

Hi Lukas
It is actually mentioned in the kernel docs that if a user is signing
off as a co-developer, they should also use Signed-off-by line
followed by their co-developed-by tag.
Link:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Please note this line: "Since Co-developed-by: denotes authorship,
every Co-developed-by: must be immediately followed by a
Signed-off-by: of the associated co-author."

(Please note the usage of "must" in the above quoted sentence.)

So, what we are doing here is just the same, ie if a user is signing
off as a Co-developer, he should also include his Signed-off-by line. ie,

1) If he has missed to add it, we will add it.
2) However, if he has added it, but in some other line than after his
Co-developed-by line, we are placing it in the preferred line, so we
aren't actually deleting his sign-off.


> As a patch author, you would need to really carefully think if this
> fix is valid or not. Do we have examples of patches where this is
> wrong and where your fix can actually be run by a specific person?
> 

Yes, there are 129 cases of this warning over v4.13..v5.8.

I have tried this fix over few patches where it gave desired result.
For eg,

E.g. 1) for Commit 951531691c4b ("mm/usercopy: use memory range to be
accessed for wraparound check"), the signed-off-by line is misplaced,
and is fixed using this fix option.
ie.
Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Co-developed-by: Prasad Sodagudi <psodagud@codeaurora.org>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>

becomes:
Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Co-developed-by: Prasad Sodagudi <psodagud@codeaurora.org>
Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>

Please note that "Signed-off-by: Prasad Sodagudi
<psodagud@codeaurora.org>" line just gets moved after their
corresponding Co-developed-by line.


E.g. 2) for Commit 31d851407f90 ("cpuidle: haltpoll: Take 'idle='
override into account"), the Signed-off-by line is missing, ie does
not exist for the author, so it is added.

ie,
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Co-developed-by: Joao Martins <joao.m.martins@oracle.com>
[ rjw: Subject ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

becomes:
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Co-developed-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[ rjw: Subject ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

which I feel is the legitimate correction, as the doc states that
Co-developed-by tag denotes authorship, so the co-developer should
also sign-off.
It is maybe similar to any patch, where user has to take
responsibility of their changes by adding their Signed-off-by line,
otherwise the patches aren't accepted.

What do you think?

This patch has some conflicts with the recent next branch. I'll send
modified rebased patch.

Thanks
Aditya



> Lukas
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
