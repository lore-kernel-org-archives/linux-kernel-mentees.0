Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620ABC5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 21:06:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90FA521481
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 21:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQCFJCbI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90FA521481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE9F68776C;
	Thu, 22 Oct 2020 21:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnj9xlchnDQX; Thu, 22 Oct 2020 21:06:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 66A80872ED;
	Thu, 22 Oct 2020 21:06:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5881AC08A1;
	Thu, 22 Oct 2020 21:06:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5373C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BB0218776C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KDfrP7aylVXL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 21:06:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D4DE0872ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 21:06:03 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bf6so1626364plb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cgx65QdBaew41efkl7/UustFO3l6mgj7XMQW6o29430=;
 b=HQCFJCbIFWvSuo38i16Rub4lCN88taQMhrFe+FRgqkw/TIv5d2DvYu2OVEn118yvBJ
 DiUL14SAQ9GOKknTCRysjQGwgVQ/UAPqOgj4a8Hb/QDiVhEPu4jAcqYSJqt1gYlJV7dG
 qQs9PKFryUjI5UhUi1PWxFIYDHTV3Sqiy4yq1jR7XdSDWEe7Viy7S2I4RYeue5ffCNcx
 sReJoJEqZRVVPwVCb0k0o64qO1xtxGn4Dk61oAEfHc33198RfjLTO4wWLQvng+hmzKb1
 fV6ZDdTt5k8iihB+MkcLuQw5mgdB+CeKp37lP092OVkGY1Q8tpgxX/YPnERsuSebJpPn
 GpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cgx65QdBaew41efkl7/UustFO3l6mgj7XMQW6o29430=;
 b=CuUweO4hgvcQSBDtIK6WcV8wAOUyEPqVlyzSWAL+0fYVnQi+mvwgUKzv/DJbzF7/1f
 eGzzVFeudXxRPZRU8EXbQl9/i5IXeIa21wJNamLu/oWpKQJH2eh7slO15ojlvxeF0gcw
 uwnTwq7y5JC+FC2mDxoyRYQgYESOgrnogJC3zGSk8bBsF/w/thLFuVKEBChGU4Gedb92
 SsoC2XGN80czdx8QRhIUwdwWp6lDd5KEx4j2ePpLfDPL6oenuksIspzC0ROHuWxL63bX
 +aVV9kX3FLcBxe0mHDo+V0PZI1Acoe5qA7013tHxaLxFAn9kZN2GF7oddVwO6T6zXXzf
 GNRA==
X-Gm-Message-State: AOAM532aj6AaKYZOhQa87Lr4dihCkX8o8VoTKSVp+ZCws7Dt9sYBhfbR
 GFJ52SXeByBPV++uQVH3Bis=
X-Google-Smtp-Source: ABdhPJwI9oxpreulvx1O3dcmUsiSwk41Tsf7f6mdhDWRoN3FNXgR/d3eY9HPYsow4LkzwSEkcYRFgg==
X-Received: by 2002:a17:902:203:b029:d2:5660:8c84 with SMTP id
 3-20020a1709020203b02900d256608c84mr4287853plc.80.1603400763218; 
 Thu, 22 Oct 2020 14:06:03 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1?
 ([2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1])
 by smtp.gmail.com with ESMTPSA id g16sm2969793pgm.38.2020.10.22.14.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 14:06:02 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201022145021.28211-1-yashsri421@gmail.com>
 <4cbbd8d8b6c4d686f71648af8bc970baa4b0ee9b.camel@perches.com>
 <5121bf7c-a126-6178-62ff-e54f0bb4cb6e@gmail.com>
 <67247b2d51aa8b2da7377e400e9191733144ed0f.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <edaa9012-d512-26fc-0aca-f0eaf889a050@gmail.com>
Date: Fri, 23 Oct 2020 02:35:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <67247b2d51aa8b2da7377e400e9191733144ed0f.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On 23/10/20 1:03 am, Joe Perches wrote:
> On Fri, 2020-10-23 at 00:44 +0530, Aditya wrote:
>> On 22/10/20 9:40 pm, Joe Perches wrote:
>>> On Thu, 2020-10-22 at 20:20 +0530, Aditya Srivastava wrote:
>>>> Presence of hexadecimal address or symbol results in false warning
>>>> message by checkpatch.pl.
>>> []
>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> []
>>>> @@ -3051,7 +3051,10 @@ sub process {
>>>>  		}
>>>>  
>>>>  # check for repeated words separated by a single space
>>>> -		if ($rawline =~ /^\+/ || $in_commit_log) {
>>>> +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
>>>> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
>>>> +		$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
>>>
>>> Alignment and use \b before and after the regex please.
>>
>> If we use \b either before or after or both it does not match patterns
>> such as:
>> +   -rw-r--r--. 1 root root 112K Mar 20 12:16'
> selinux-policy-3.14.4-48.fc31.noarch.rpm
> 
> OK, thanks, it's good you checked.
> 
>>> []
> 
>>> What does all this code actually avoid?
>>
>> Sir, there are multiple variations of hex for which this warning is
>> occurring, for eg:
>> 1) 00 c0 06 16 00 00 ff ff 00 93 1c 18 00 00 ff ff  ................
>> 2) ffffffff ffffffff 00000000 c070058c
>> 3)     f5a:       48 c7 44 24 78 ff ff    movq
>> $0xffffffffffffffff,0x78(%rsp)
>> 4) +    fe fe
>> 5) +    fe fe   - ? end marker ?
>> 6) Code: ff ff 48 (...)
> 
> So why not just match first with /^[0-9a-f]+$/i ?
> 
> Doesn't that match all the cases listed above?
> 
> 

Then, we'll not be able to account for cases such as:

1) +     * sets this to -1, the slack value will be calculated to be be
halfway [For 'be' 'be']
2) + * @seg: index of packet segment whose raw fields are to be be
extracted [For 'be' 'be']
3) Let's also add add a note about using only the l3 access without l4
[For 'add' 'add']

where it will not detect them.

Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
