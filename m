Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E862C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 16:29:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCCBB247B6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 16:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APt6ZJ32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCCBB247B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C7FF84E66;
	Wed, 28 Oct 2020 16:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1V+z6w7C5mQ; Wed, 28 Oct 2020 16:29:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5F0584C53;
	Wed, 28 Oct 2020 16:29:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9E97C088B;
	Wed, 28 Oct 2020 16:29:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A24EAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8841284E66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mljrQFwg2YTr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:29:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B23BF84C53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 16:29:00 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id az3so67933pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QMysaXkfAAY8CQflC5g8XSLA4O2VZ9LANTV6gaSM91o=;
 b=APt6ZJ32fo0sQad6MRm/PRdpBjA+3ti5+PpEcA+8Iq04/RkJ+taq5GY/71wOi9AlSv
 uPhVLxX/scre4QFnQWX/vv4S31QkjGJG6qFAZT/Jnr5fQtn+lmbzjaFNmY6xo+PAKyLA
 uus5wopnKGZhUNEHBcbQsj945g+iweCFCkfzVGPt4/E58X+1odSVTgrHUv0wrWD3iMLW
 nO97ngR8FfmuyxW0vXaxXBi0MzIhKgumP33C46d35YSyBYhEXDueSBjA/YD/o7TJcNpu
 diz9ixD8wXA9njP51/B0lmW50DGSb/txaJ8VT5W3Jby69JrFh9STx8Pn/sjWagiWddaS
 KqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QMysaXkfAAY8CQflC5g8XSLA4O2VZ9LANTV6gaSM91o=;
 b=eG4jydbANkhA7DlygU/AODRHDsnNVPTk/dGmTkCA4fT7HBxgxDRzZTOScUGfLUF4Rz
 7hTg3jQAzUfgzYdCQQwou8jIPw1HHZNoCwrCKBpCMgoGE4255FiFZyxChp6CL8gldblR
 eGEOCVIq+zb1CrYekwHgBG84Tu2ceWXwbXG7ExojZXImnUw1A9ITbQt387ZVcvFHS9VO
 Hb5ftMMKbCXgSVxMaV8jBb19FOjj79EtFGEIhPgyRjreqAtq93a9w9yCln78WcmBS5ZP
 omzwVAiwKU5Ruhzj3aN7+95TtRWgO6gsi9kIynMptCr4aY4VM2cvtRNeKGj5UdHiMWCn
 YBTg==
X-Gm-Message-State: AOAM530NaXKNNAA8nfhdD0WwMseo2SuzEFbP5bDrNixP0ZrmWOlfBUK8
 +iXxO7lFjr1kUYOd7e60OvPnwKpspF7HMA==
X-Google-Smtp-Source: ABdhPJxCIUoUXR8TjIMxHW+NLEatFabByqpJkfHktdeqaSTQKHpmH8PEXA2bsyucFfzGXDWzun01Nw==
X-Received: by 2002:a17:90b:e8b:: with SMTP id fv11mr58051pjb.83.1603902539912; 
 Wed, 28 Oct 2020 09:28:59 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41e:761b:9145:f028:1ed9:d699?
 ([2402:3a80:41e:761b:9145:f028:1ed9:d699])
 by smtp.gmail.com with ESMTPSA id z7sm122809pfz.5.2020.10.28.09.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 09:28:59 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
 <alpine.DEB.2.21.2010281659160.13040@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
Date: Wed, 28 Oct 2020 21:58:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010281659160.13040@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: improve handling
	of email comments
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

On 28/10/20 9:29 pm, Lukas Bulwahn wrote:
> 
> 
> On Wed, 28 Oct 2020, Dwaipayan Ray wrote:
> 
>> On Wed, Oct 28, 2020 at 8:55 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>>
>>> checkpatch has limited support for parsing email comments. It only
>>> support single name comments or single after address comments.
>>> Whereas, RFC 5322 specifies that comments can be inserted in
>>> between any tokens of the email fields.
>>>
>>> On analyzing 50,000 commits from v5.4 it was found that there were
>>> about 370 false positives resulting from wrong parsing of comments.
>>>
>>> Improve comment parsing mechanism in checkpatch.
>>>
>>> What is handled now:
>>>
>>> - Multiple name/address comments
>>> - Comments anywhere in between name/address
>>> - Multi level comments like (John (Doe) )
>>>
>>> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>>> ---
>>>  scripts/checkpatch.pl | 19 ++++++++++++++-----
>>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index fab38b493cef..ae8436385fc1 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -1183,14 +1183,20 @@ sub parse_email {
>>>                 }
>>>         }
>>>
>>> -       $comment = trim($comment);
>>> +       # Comments in between name like John(A nice chap) Doe
>>> +       while ($name =~ s/\s*($balanced_parens)\s*/ /) {
>>> +               $name_comment .= trim($1);
>>> +       }
>>>         $name = trim($name);
>>>         $name =~ s/^\"|\"$//g;
>>> -       if ($name =~ s/(\s*\([^\)]+\))\s*//) {
>>> -               $name_comment = trim($1);
>>> +
>>> +       # Comments in between address like <john(his account)@doe.com>
>>> +       while ($address =~ s/\s*($balanced_parens)\s*//) {
>>> +               $comment .= trim($1);
>>>         }
>>>         $address = trim($address);
>>>         $address =~ s/^\<|\>$//g;
>>> +       $comment = trim($comment);
>>>
>>>         if ($name =~ /[^\w \-]/i) { ##has "must quote" chars
>>>                 $name =~ s/(?<!\\)"/\\"/g; ##escape quotes
>>> @@ -1205,8 +1211,6 @@ sub format_email {
>>>
>>>         my $formatted_email;
>>>
>>> -       $name_comment = trim($name_comment);
>>> -       $comment = trim($comment);
>>>         $name = trim($name);
>>>         $name =~ s/^\"|\"$//g;
>>>         $address = trim($address);
>>> @@ -1216,6 +1220,11 @@ sub format_email {
>>>                 $name = "\"$name\"";
>>>         }
>>>
>>> +       $name_comment = trim($name_comment);
>>> +       $name_comment =~ s/(.+)/ $1/;
>>> +       $comment = trim($comment);
>>> +       $comment =~ s/(.+)/ $1/;
>>> +
>>>         if ("$name" eq "") {
>>>                 $formatted_email = "$address";
>>>         } else {
>>> --
>>> 2.27.0
>>>
>>
>> Hi,
>> This patch is a follow up to our discussion earlier about improving the
>> comment handling at:
>> https://lore.kernel.org/linux-kernel-mentees/alpine.DEB.2.21.2010251022060.25172@felia/
>>
>> I have only tested it on a few patterns.  But I will run an
>> evaluation again on those 50k commits to see what changes.
>>
>> What do you think of this?
>>
> 
> That was exactly the comment I wanted to make.
> 
> Commit message is clear; code addition also looks pretty clear.
> 
> We are just missing the evaluation to make sure how much we improve and 
> that we did not add some stupid bug on the way.
> 
> Aditya, can you help us here with evaluation?
> 
> E.g., Dwaipayan takes from v5.4 into the future, e.g., until v5.8/v5.9 or 
> so.
> 
> Aditya, you could then check e.g., v5.0..v5.4, so v5.4 down to the past as 
> far as your computer and scripts handles within roughly half a day...
> 
> An evaluation on 100,000 commits is certainly a good basis.
> 
> Of course, every mentorship candidate can join here as well and show off 
> their own evaluation script.
> 
> Lukas
> 

Sure, would love to help.
Just to clear, I have to apply this patch over my last patch right? Or
do I need to apply any more patch before it?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
