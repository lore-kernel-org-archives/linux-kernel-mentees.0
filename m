Return-Path: <SRS0=JFU2=FN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1DAC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 11:46:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB04723B5D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 11:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB04723B5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A656D8777E;
	Wed,  9 Dec 2020 11:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6cd-YGon7b5T; Wed,  9 Dec 2020 11:46:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D148787767;
	Wed,  9 Dec 2020 11:46:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5311C0893;
	Wed,  9 Dec 2020 11:46:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6ED9C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 11:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B59B38777E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 11:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7wH5-3EVbMI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 11:46:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DFFF987767
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 11:46:46 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c79so864526pfc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Dec 2020 03:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JMJ0quPZDBTFyDW1fQ5Hc5IoA1jjwTixmJQeQnXR6AA=;
 b=S7tSDhn0EYXokY+9d831b+a0rvtUsnR+vsq0HodrAarhXbHhhtXYyrfifoXin4+RdG
 ZmErYUxYtCInzFcM7CwmpvVUaLyZJynUagYNU39phk0mPz3c8A+HBT0vFxFS5qLuj4Bo
 duj+U4XVp5o+GwBWlj2pWgXnNY4Ti2gxiTqu54miqJQBnLP+4GCUWc21+vT45ANDVHHt
 ycO5vL7pS1cqpiSqK3TUVdqMxd5RaAUIXz1y2++QOfKd4GnradKiEe/UoAJlkcjWp5lZ
 kFcGzjLzIfD1vkS1MPWe6cnJh5lRmhPS8oEbZn54fyzInGGjWmjW1XOtCJLm0vBsProh
 9zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JMJ0quPZDBTFyDW1fQ5Hc5IoA1jjwTixmJQeQnXR6AA=;
 b=g2eAqkNK1OfPteaQ79rQ1D40IIDFfFDpW0qYxL81UwPnwifMmd3hJ7os09gdxsjbQf
 qmwSPXFsa3ZXf56dkiDMwgE/T/q6mc0Cmr0OyftXo0pw595CaiybHc0o7vnm04ZCPHh1
 jyrnj5zHfxyJbSfi4GDhUWRE4AKacI7GXyusmcby6cv1AXE8gIRK31E/GTRERUtro1TE
 sia8q0AgWSlobuCpUZ1zn2NApsIryZRnYp9TIQib2vgdGKADhdZ5L4x8LjaP2opbTDzl
 869evUY4jPKQxwojPhjLkhC8/Vq9fQ9kgkohgZGK3W+lfUedvF/v68vpvvetfscjoK7y
 VkVA==
X-Gm-Message-State: AOAM5319sINjTly+1+QyeAT4TFwWaBSr73Tl6DkxdPmSDCme5yzh3qyE
 AGFU7Oj0L5hTaa/FunSmm9eLTFoGp83uoA==
X-Google-Smtp-Source: ABdhPJyyYbQeoRi9G6l+Uhff33np3K7W5f8tfNb4/4U6Vs3W2lZhrVXX/Ufkp7HoaBSQaj0UkQpINw==
X-Received: by 2002:aa7:8649:0:b029:19e:16df:e5f8 with SMTP id
 a9-20020aa786490000b029019e16dfe5f8mr2006011pfo.41.1607514406116; 
 Wed, 09 Dec 2020 03:46:46 -0800 (PST)
Received: from ?IPv6:2402:3a80:405:5180:6502:c162:a66c:507f?
 ([2402:3a80:405:5180:6502:c162:a66c:507f])
 by smtp.gmail.com with ESMTPSA id v8sm1974882pju.32.2020.12.09.03.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 03:46:45 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201202183649.9773-1-yashsri421@gmail.com>
 <540be894-a369-160f-25cc-a22a06612c9f@gmail.com>
 <CAKXUXMyhw4rKNesshCdHT+mLJ9PEkA+ZJO7bFXZciNFDZKHtBA@mail.gmail.com>
 <9ee46b5d-d849-cd6c-39f4-11e6850edbd6@gmail.com>
 <CAKXUXMyT-t6wW_Fm42WY+59MxaR2-7HEcbro9WL-64YaCaNZHA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <b5b5c026-6774-2237-1145-94396864370e@gmail.com>
Date: Wed, 9 Dec 2020 17:16:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyT-t6wW_Fm42WY+59MxaR2-7HEcbro9WL-64YaCaNZHA@mail.gmail.com>
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

On 9/12/20 2:37 am, Lukas Bulwahn wrote:
> On Tue, Dec 8, 2020 at 6:44 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 8/12/20 10:24 pm, Lukas Bulwahn wrote:
>>> On Tue, Dec 8, 2020 at 5:44 PM Aditya <yashsri421@gmail.com> wrote:
>>>>
>>>> On 3/12/20 12:06 am, Aditya Srivastava wrote:
>>>>> Currently checkpatch warns us if the Co-developed-by line for an author
>>>>> isn't immediately followed by the Signed-off-by line.
>>>>>
>>>>> Generally, this warning occurs because of:
>>>>> 1) Absence of Signed-off-by line for the author from the patch
>>>>> 2) Misplaced Signed-off-by line for the author in the patch
>>>>>
>>>>> Provide a simple fix by:
>>>>> 1) Inserting Signed-off-by line for the author immediately after the
>>>>> Co-developed-by line
>>>>>
>>>>> 2) Removing Signed-off-by line for the author (if it pre-existed on
>>>>> some other line)
>>>>>
>>>>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>>>> ---
>>>>>  scripts/checkpatch.pl | 28 ++++++++++++++++++++++++----
>>>>>  1 file changed, 24 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>>> index 5c9f13a97c12..d8f9d4d8b13d 100755
>>>>> --- a/scripts/checkpatch.pl
>>>>> +++ b/scripts/checkpatch.pl
>>>>> @@ -2509,6 +2509,9 @@ sub process {
>>>>>       my @setup_docs = ();
>>>>>       my $setup_docs = 0;
>>>>>
>>>>> +     my %signed_off_by_lines;
>>>>> +     my %co_developed_by_lines;
>>>>> +
>>>>>       my $camelcase_file_seeded = 0;
>>>>>
>>>>>       my $checklicenseline = 1;
>>>>> @@ -2794,6 +2797,7 @@ sub process {
>>>>>                                       my $ctx = $1;
>>>>>                                       my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
>>>>>                                       my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
>>>>> +                                     $signed_off_by_lines{$ctx} = $fixlinenr;
>>>>>
>>>>>                                       if ($email_address eq $author_address && $email_name eq $author_name) {
>>>>>                                               $author_sob = $ctx;
>>>>> @@ -2989,11 +2993,17 @@ sub process {
>>>>>                                       }
>>>>>                               }
>>>>>                               if (!defined $lines[$linenr]) {
>>>>> -                                     WARN("BAD_SIGN_OFF",
>>>>> -                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
>>>>> +                                     if (WARN("BAD_SIGN_OFF",
>>>>> +                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline) &&
>>>>> +                                         $fix) {
>>>>> +                                             $co_developed_by_lines{$email} = $fixlinenr;
>>>>> +                                     }
>>>>>                               } elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
>>>>> -                                     WARN("BAD_SIGN_OFF",
>>>>> -                                          "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
>>>>> +                                     if (WARN("BAD_SIGN_OFF",
>>>>> +                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]) &&
>>>>> +                                         $fix) {
>>>>> +                                             $co_developed_by_lines{$email} = $fixlinenr;
>>>>> +                                     }
>>>>>                               } elsif ($1 ne $email) {
>>>>>                                       WARN("BAD_SIGN_OFF",
>>>>>                                            "Co-developed-by and Signed-off-by: name/email do not match \n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
>>>>> @@ -7203,6 +7213,16 @@ sub process {
>>>>>               ERROR("NOT_UNIFIED_DIFF",
>>>>>                     "Does not appear to be a unified-diff format patch\n");
>>>>>       }
>>>>> +
>>>>> +     if (%co_developed_by_lines) {
>>>>> +             foreach my $co_developer (keys %co_developed_by_lines) {
>>>>> +                     if (exists($signed_off_by_lines{$co_developer})) {
>>>>> +                             fix_delete_line($signed_off_by_lines{$co_developer}, "Signed-off-by: $co_developer");
>>>>> +                     }
>>>>> +                     fix_insert_line($co_developed_by_lines{$co_developer} + 1, "Signed-off-by: $co_developer");
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>>       if ($is_patch && $has_commit_log && $chk_signoff) {
>>>>>               if ($signoff == 0) {
>>>>>                       ERROR("MISSING_SIGN_OFF",
>>>>>
>>>>
>>>
>>> Not a big fan of that. Especially because adding and removing
>>> Signed-off-by: from a trail has a specific meaning.
>>>
>>> So that fix can only be applied under very specific conditions. You
>>> cannot just sign a document in the name of another person, that is
>>> clearly fraud and identity theft.
>>>
>>
>> Hi Lukas
>> It is actually mentioned in the kernel docs that if a user is signing
>> off as a co-developer, they should also use Signed-off-by line
>> followed by their co-developed-by tag.
>> Link:
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>>
>> Please note this line: "Since Co-developed-by: denotes authorship,
>> every Co-developed-by: must be immediately followed by a
>> Signed-off-by: of the associated co-author."
>>
>> (Please note the usage of "must" in the above quoted sentence.)
>>
>> So, what we are doing here is just the same, ie if a user is signing
>> off as a Co-developer, he should also include his Signed-off-by line. ie,
>>
>> 1) If he has missed to add it, we will add it.
> 
> Only the person with that identity is allowed to do that. Nobody else.
> 
Okay.

> How do you know who is running this script?
> 

We can probably check it using git config to get user's signature and
match it against the signature we are going to add. Only if they
match, we add it.
But again the user may not be aware that his sign-off got added by
running the script.
I suggest, we can probably give them a MISSING_SIGN_OFF warning for
it, and if they choose to fix that, we can probably add the line. What
do you think?


> Nobody is allowed to add a Sign-off-by: for another person.
> The documentation should clearly state that as well.
> 
>> 2) However, if he has added it, but in some other line than after his
>> Co-developed-by line, we are placing it in the preferred line, so we
>> aren't actually deleting his sign-off.
>>
> 
> That might be legitimate, but the order of Signed-off-by: has a
> meaning itself, so maybe you are breaking that then as well.
> 
>>
>>> As a patch author, you would need to really carefully think if this
>>> fix is valid or not. Do we have examples of patches where this is
>>> wrong and where your fix can actually be run by a specific person?
>>>
>>
>> Yes, there are 129 cases of this warning over v4.13..v5.8.
>>
>> I have tried this fix over few patches where it gave desired result.
>> For eg,
>>
>> E.g. 1) for Commit 951531691c4b ("mm/usercopy: use memory range to be
>> accessed for wraparound check"), the signed-off-by line is misplaced,
>> and is fixed using this fix option.
>> ie.
>> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> Co-developed-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
>>
>> becomes:
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> Co-developed-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
>>
>> Please note that "Signed-off-by: Prasad Sodagudi
>> <psodagud@codeaurora.org>" line just gets moved after their
>> corresponding Co-developed-by line.
>>
> 
> Reordering might make sense.
> 
>>
>> E.g. 2) for Commit 31d851407f90 ("cpuidle: haltpoll: Take 'idle='
>> override into account"), the Signed-off-by line is missing, ie does
>> not exist for the author, so it is added.
>>
>> ie,
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
>> Co-developed-by: Joao Martins <joao.m.martins@oracle.com>
>> [ rjw: Subject ]
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>
>> becomes:
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
>> Co-developed-by: Joao Martins <joao.m.martins@oracle.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> [ rjw: Subject ]
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>
>> which I feel is the legitimate correction, as the doc states that
>> Co-developed-by tag denotes authorship, so the co-developer should
>> also sign-off.
>> It is maybe similar to any patch, where user has to take
>> responsibility of their changes by adding their Signed-off-by line,
>> otherwise the patches aren't accepted.
>>
> 
> Yes, but how do you check that only Joao Martins runs this script and
> nobody else?
> 
> That is why this feature is ultimately broken, and I would be very
> careful if someone really just said I ran checkpatch --fix for that.
> 

I think for this fix, we should limit to reordering sign-off after
their corresponding Co-developed-by: tag and not adding new sign-off.

Although we can check if the same user is running checkpatch, by using
git-config, but he may still be unaware that his sign-off gets added
by running the script.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
