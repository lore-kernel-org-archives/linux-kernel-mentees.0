Return-Path: <SRS0=9wI6=D2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F58BC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Oct 2020 09:27:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6629C2225F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Oct 2020 09:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVA0kxPn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6629C2225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 96948871F6;
	Mon, 19 Oct 2020 09:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXJkizcVJmvI; Mon, 19 Oct 2020 09:27:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E300D871F1;
	Mon, 19 Oct 2020 09:27:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C539FC0052;
	Mon, 19 Oct 2020 09:27:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DADFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Oct 2020 09:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1945D871F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Oct 2020 09:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72-1atBG6s-a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Oct 2020 09:27:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3BB92871F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Oct 2020 09:27:01 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id gm14so5010614pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Oct 2020 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mSPWC+SbPhJX/Hl3zUBJZC7owU0cBXOV/08yAHqCPBA=;
 b=VVA0kxPnK99LITck+tc5TsdO9NOoLdXvbpnxQsArqDiJErA4ROx2hxzO5+cfNEc1aO
 SSbSkEyDMoSWuh4TjPjurm6nOQTWDzI2r9+gWGBb0za4vE68ztfc5egaLdbx8gKe+FyP
 shRoi4mmnBrce7/pPkHgSusyOIuxbUhXj4g5xpWgNYDOuq3NgfpBtPwdFcqr0rc9jdf8
 igZkpITBC+pAHK/0llJUQ4ZfHVxPWqxkAaYZen91MmpjhD0iv66fPHH50cAK7URdBcfN
 OgtcCz61sogKWs4XiADxVIHYsH+KxL+DwM3BprnJoTRcHRSJzwd4Vo6NmmOLljeSrzfI
 Rl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mSPWC+SbPhJX/Hl3zUBJZC7owU0cBXOV/08yAHqCPBA=;
 b=P+kQOKyyAU1Ofn03bfvsxAxFRpAnhiHkxkQ/dGn68xI6gbr10VoQ/GlTjlMgIZ1dhd
 hjcwOO2B5JK1OUF2rDwHurU643Me+nXqTadqk2kQ9aaiUVlal2/SqrudZm+jbVKoOvnT
 j3priLc+41xlIK/BcRJd/fU+6Nxkt/XvvofvMVef/Msoj1NgCbI+E9Ckd1bcc7nYGViR
 qMBLIF6sGR7Z1RYvD06f6IH9A/75XsO+5O/3CvnnO27Mp8n/YJQDTL6/k0W95AvxUCm6
 SL5Z6dT1LaB8MoyOdqpWJtVpeejrUkdLSn+x6QmolDA54pCLStcNed1jgTK21kb/9ror
 DGxg==
X-Gm-Message-State: AOAM530RzMqkDI4YI1w4S4ysnFYS1b0tuaWbwC08fsSt5ewywitYdaU+
 lbyhktzOK5tbmZ98UNSK2MQ=
X-Google-Smtp-Source: ABdhPJzR+/3NtpcmOCZV8YNKqoje0NPF/udToChP7T2Q93tnCcUcA70Uj4jWmOcsxXXAsDx7S0Emuw==
X-Received: by 2002:a17:90a:19d2:: with SMTP id
 18mr4066774pjj.167.1603099620582; 
 Mon, 19 Oct 2020 02:27:00 -0700 (PDT)
Received: from [192.168.43.245] ([42.111.139.4])
 by smtp.gmail.com with ESMTPSA id l82sm11992652pfd.102.2020.10.19.02.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 02:27:00 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201013060714.33713-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010130811050.14590@felia>
 <ebc09f62-7ba3-0965-e999-0ca33156f40f@gmail.com>
 <72615293-a433-9d19-ae9e-ec9dd2c2073c@gmail.com>
 <alpine.DEB.2.21.2010180933020.6939@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <9145c954-e644-3bda-56d8-d91af7803947@gmail.com>
Date: Mon, 19 Oct 2020 14:56:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010180933020.6939@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
	whitespace in formatted email
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

On 18/10/20 1:13 pm, Lukas Bulwahn wrote:
> 
> 
> On Sat, 17 Oct 2020, Aditya wrote:
> 
>>
>> On Wed, Oct 14, 2020 at 10:33 PM Aditya <yashsri421@gmail.com> wrote:
>>
>>>
>>> On 13/10/20 11:46 am, Lukas Bulwahn wrote:
>>>>
>>>> On Tue, 13 Oct 2020, Dwaipayan Ray wrote:
>>>>
>>>>> Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
>>>>> checks.") introduced new checks for author sign off. The format_email
>>>>> procedure was modified to add comment blocks to the formatted email. But
>>>>> no space was added between the email address and mail comment.
>>>>>
>>>>> This causes wrong email formatting in cases where the email is in the 
>>> form
>>>>> "author@example.com (Comment block)". The space between the address and
>>>>> comment block is removed, which causes incorrect parsing of the
>>>>> formatted email.
>>>>>
>>>>> An evaluation on checkpatch brought up this case. For example,
>>>>> on commit 1129d31b55d5 ("ima: Fix ima digest hash table key 
>>> calculation"),
>>>>> the following warning was reported:
>>>>>
>>>>> WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big 
>>> endian
>>>>> system concerns)' might be better as 'David.Laight@aculab.com(big 
>>> endian
>>>>> system concerns)'
>>>>>
>>>>> Add a single space in between the address and comment when the
>>>>> extracted comment is not empty.
>>>>>
>>>> Dwaipayan, looks good to me.
>>>>
>>>> So, how about a 'Fixes:' tag?
>>>>
>>>> Aditya, can you rerun your evaluation with this fix patch applied on top?
>>>>
>>>> Then, we need a comparison for:
>>>> 1. completely before vs. after the two patches, and
>>>> 2. after the first patch vs. after the two patches (to see that the fix 
>>>> works)
>>>>
>>>> More support on evaluation from others interested to become mentees are 
>>> of 
>>>> course welcome.
>>>>
>>>> Lukas
>>>>  
>>>>> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>>>>> ---
>>>>>  scripts/checkpatch.pl | 4 +++-
>>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>>> index fab38b493cef..f1a4e61917eb 100755
>>>>> --- a/scripts/checkpatch.pl
>>>>> +++ b/scripts/checkpatch.pl
>>>>> @@ -1221,7 +1221,9 @@ sub format_email {
>>>>>      } else {
>>>>>              $formatted_email = "$name$name_comment <$address>";
>>>>>      }
>>>>> -    $formatted_email .= "$comment";
>>>>> +    if ("$comment" ne "") {
>>>>> +            $formatted_email .= " $comment";
>>>>> +    }
>>>>>      return $formatted_email;
>>>>>  }
>>>>>  
>>>>> -- 
>>>>> 2.27.0
>>>>>
>>>>>
>>> Hi Sir
>>>
>>> I have analyzed the reports using this patch and made comparison. The 
>>> links are as follows:
>>>
>>> 1. completely before vs. after this patch: 
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/before_v_second/summary_relative.txt
>>> 2. after the first patch vs. after the two patches: 
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/first_v_second/summary_relative.txt
>>>
>>> Kindly let me know if you have any questions.
>>>
>>> Aditya
>>>
>>>
>>
>> Hi Sir
>> I have completed all the assigned tasks. What should be my next steps to participate as a mentee in the community bridge program?
>> Kindly guide me regarding it.
>>
> 
> (your email client is broken; it should not spread lines so long...)
> 
> Aditya, you are on a good way to be towards acceptance for a kernel 
> mentorship.
> 
> If I am not mistaken, you have not created yet a non-trivial patch to 
> checkpatch.pl and got your patch accepted.
> 
> 
> Look at your own checkpatch.pl evaluation, find a relevant case where 
> checkpatch.pl reports a large class of false positives and think about how 
> to improve checkpatch.pl.
> 
> Especially, when looking at checkpatch.pl complaining about suspicious 
> code patterns or style and formatting, you might want to compare to the 
> capabilities of compiler static analysers (clang-tidy) or clang-format.
> 
> Improving those tools, making them the warning-free for the specific 
> class and supporting to make them default tools might also be a good 
> extension to the goals of checkpatch.
> 
> Let us know which kind of false positive class you found and would like to 
> improve.
> 
> Dwaipayan and I can help if you really do not find anything at all...
> 
> Good luck :)
> 
> 
> Lukas
> 

Hi Sir,
I observed the reports as you suggested.
I found out that "REPEATED_WORD" is the third most frequent warning in
v6..v8 with frequency of 2797. Although this does give correct
messages most of the times, but a large proportion(probably more than
50%) of this error comes out of hexadecimal being a part of the commit
or code.
For eg, WARNING:REPEATED_WORD: Possible repeated word: 'ff'
#21:
Code: 00 77 27 48 81 ff 00 00 01 00 76 07 0f b7 d7 ed 0f c8 c3 55 48
c7 c6 3b ee d5 9f 48 89 e5 e8 67 fc ff ff b8 ff ff ff ff 5d c3 <8b> 07
0f c8 c3 66 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff 03

Now, here it reports 'ff' to be repeated many times. But I believe
that this was not the expected outcome from this warning.

I think that such warnings should be avoided from this class tag of
warning.

My approach: Use regex to know if the repeated words are of '2' length
and occur among such pattern which consists of 2 lettered words
repeated 5-6 times,ie. size(/[a-f0-9]{2}\s/)>6, eg. "04 19 00 00 c3 48
83 ec 08 e8 0a fa ff ff 48 89 04 24 b8 02 00 00 00 0f".
As normally such occurrences do not occur in English, it can be an
effective method to avoid such hexadecimal occurrences.

Kindly let me know if I can proceed with this. Also, please suggest if
there is a better way to counter this issue.

Thank You
Sincerely
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
