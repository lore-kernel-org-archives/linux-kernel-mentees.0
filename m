Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51E7C61DD8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:00:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F7B92222F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPSxN5/v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F7B92222F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF4B48702C;
	Fri, 13 Nov 2020 15:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUTkhXfixJ2f; Fri, 13 Nov 2020 15:00:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7548087029;
	Fri, 13 Nov 2020 15:00:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C9AAC0FAA;
	Fri, 13 Nov 2020 15:00:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33E52C088E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2F933874BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fexf4SiySPQ7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:00:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0C9EA87468
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:00:11 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id t21so947696pgl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 07:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=igALyqih3vUNT8HlJB+uv5LgFdL3ZvUo0l16jL39H4E=;
 b=kPSxN5/vrO2EUsfRfRPSx9ntG00zahasFk+MZJR9heoqRzoKGX05jykkhZyou1W2hM
 84kROCBjwAHWC5Cs6lTRNRCLR+zu/kXtlHKnJ1+ymXLLkkxajkAnsTSgtsbZxYsEXdiD
 JcwKY2xC5FkAP6w7riNYiWN8/QVdd7zKiJ9FViOa/p38Mg2OC2ve7/1ZfwfK92rG/dHG
 TezpYO0lF8WIFfqZHREESsbAngbg0cF9rZW50RyFJ+0K4u7BNErtKjrntXg8Zk+CjGr6
 BpV24IH3h0fcpjgXFgXBzm9G4sMDCIt+OPrgTPnsnuBMSUUAiK9wzW9B6zy+IPz3qYIr
 hDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=igALyqih3vUNT8HlJB+uv5LgFdL3ZvUo0l16jL39H4E=;
 b=V2z3XyDhN5PoXQwCEueflJj8jxJ4LOY+RTb1KV3WywDMMu7hTKF3E14D7VfM5LJz6b
 7GGPAYOZs4vhw4yP39hIq/3UK07lfOhAnWITvOd4JhmRo/aNVMsQpK69zDOLQtbihikO
 q+/eHxVddCfCsHXPh7yaQqNK1rQUK60eVZZVLwZDSG4ZcK/J4O3ur8FUs1qw+0yi7ia1
 zi+iUe9CePqXd9jmbPy4lgz827aMHUOVHKO3eyMtPT7+zXvD2gtefP2nE/tQ/aQuHrEp
 t9FsYikEfaELUFza/ezZvvYj7cU+2ZoXIbPx5VKB6cYzompGM60Ym2Z5GEaezodpYVln
 ll2A==
X-Gm-Message-State: AOAM531AoYtW/bt7MpXCic/oLIzA0tNBOOwtF5T8pgSoNA0ljAZTXdOR
 ZE1wzyb2LK0IeHcL8ecWV+lLv0FG8KXaxQ==
X-Google-Smtp-Source: ABdhPJwE7T6Utp0Ks3BXKM1ejol+9L5S8iowRPmETn7dOkyqJb+igsE2mNhghJEKwqvHyym6oCa0Bg==
X-Received: by 2002:a17:90a:c201:: with SMTP id
 e1mr3332628pjt.16.1605279610157; 
 Fri, 13 Nov 2020 07:00:10 -0800 (PST)
Received: from [192.168.43.245] ([42.111.139.114])
 by smtp.gmail.com with ESMTPSA id i26sm10391867pfq.148.2020.11.13.07.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 07:00:09 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
Message-ID: <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
Date: Fri, 13 Nov 2020 20:30:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fix for BAD_SIGN_OFF: non-standard
	signature
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

On 13/11/20 8:05 pm, Aditya wrote:
> On 12/11/20 1:34 am, Lukas Bulwahn wrote:
>> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
>>>
>>> Hi Sir
>>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
>>> v4.13..v5.8) for non-standard signature and generated reports for it.
>>> Some mistakes are more frequent than others, whereas some mistakes
>>> even have a frequency of 1.
>>>
>>> Non-standard signatures occurring with their frequency:
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>>
>>> Complete warning messages:
>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
>>>
>>> Should I implement the fix similar to TYPO_FIX, where we have a
>>> separate file for common misspellings and corrected words? Or should I
>>> make a hash of these misspellings in checkpatch.pl file as well?
>>>
>>> Also should I include all these misspelled words in it? Or omit words
>>> below certain frequency?
>>>
>>
>> I think the best way would be to compute some kind of edit distance to
>> the known signature tags and if this edit distance is below a certain
>> threshold, suggest that signature tag as the fix. We can then evaluate
>> to determine the best suitable threshold. The edit distance between
>> the different tags are so large that this should always work as
>> intended.
>>
>> Then, we can look into these other creative tags and propose suitable
>> existing tags for the more frequent ones that are non-standard. Or in
>> the case, none of the existing ones fit we can start the discussion on
>> proposing some new standard ones.
>>
> 
> I have generated a list of non-standard signatures and their fixes on
> the basis of edit distance.
> 
> This is the common list of non standard signatures and fixes (in
> detail):
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt
> 
> As I observed, I think, we can consider '<=2' as the threshold edit
> distance.
> List for non-standard signature and their proposed fix with edit
> distance<=2 :
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt
> 
> I have also generated lists for 3 and 4 edit distance separately for
> reference:
> Equal to 3:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt
> 
> Equal to 4:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt
> 
> For the rest I guess we'll need to hard code eg. for 'Debugged-by',
> 'Requested-by' etc.
> 
> These are the complete lists of non-standard signatures:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
> 
> What do you think?
> 

For the calculation of edit distance, I have lower-cased the string
and removed hyphens from the string before comparison. This helps to
avoid increase in threshold for any misplaced hyphens

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
