Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D0FC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 08:21:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7CB12067C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 08:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeDlWw64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7CB12067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D16C86741;
	Mon, 16 Nov 2020 08:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0JIJVda-ZbJ3; Mon, 16 Nov 2020 08:21:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98D1C86739;
	Mon, 16 Nov 2020 08:21:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9A9C0800;
	Mon, 16 Nov 2020 08:21:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3298AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 197BE85F3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWD5YY90ws_v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:21:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 478F185F3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:21:42 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q28so2033538pgk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 00:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z1kiidag7uIrKWdaFLUMiKmyyT0qLaMhrTFUIA9awpc=;
 b=KeDlWw64tc+7COhCdGBz1W/DvVLwCvblHXVvG3G8jtFina0Ie0m25nKoivM8X4PMNn
 +zafeQ2c0wQr0pZYacYjXfIB3nCMJjRXAnZJN6krPOFqnPADbdoCFrZ7ggAAUBzCQq+m
 oTwstCixUfK+/cpCg0ilsEOjCvoxaTGwVJrEy3QuaG67D4Bd/HR/31SEBb9Buwxht1+r
 d6pfGizPxIsw6cNNYY8IptPDhVOwvtyQAuqtVFRIpwJEMG0a6uOG4laI45H+1Q65P0U/
 /uMCbdbwm0Ep3qn/86BKGMDZ1PbnvlHKafiKQzkGPfx0nUYH2XAclhV1Zpj/Py85y8oH
 TBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z1kiidag7uIrKWdaFLUMiKmyyT0qLaMhrTFUIA9awpc=;
 b=q7/jJleOzDR+s+6MQRDF6aYOPunjjCzGwXi4O6GECtJ8Y2WKxrV+D7ZEqkr9ZvaY/6
 KoWVtH2iq2yFUpX3fXrnPGhXOJ6IjHDrduMMTMsLoh+gl6RDwDnVPVFIN2x/mlQ5Zn7T
 QDl7sO7exOd1RVeMDmgmBkDpe2rl1/TTYura8bKlyOXevT2WauIgjGXBDUdLrM3hdMgL
 C06j+0H9f9c6HsBXoOALrKq1LgtX17IG0OwMuNc9o4bOmBRWqapeb8IRxywT/NpT9LKD
 fOgcij76UJ/fHd1r+YdmMaMSk3getmynqZxnns+q2IKVKlbmtyqmzKt0ekD4UbmEKuc8
 GQ2A==
X-Gm-Message-State: AOAM533JysjboIx3LrZcjRhL+beeA0lH7vZyyq1WrsZLSnNWRzzY4I8P
 wkwEIjJSOeEpQ6K+ny3RGkm31y5aUn2Ryg==
X-Google-Smtp-Source: ABdhPJxavGsTMEIapfz1cKr17rLYNIcWI0HoQ1yGilkhmN6/PU4k9yPz0yk9hpkBQNy1Trbmb6dKJA==
X-Received: by 2002:a17:90b:1289:: with SMTP id
 fw9mr15210263pjb.85.1605514901511; 
 Mon, 16 Nov 2020 00:21:41 -0800 (PST)
Received: from [192.168.43.245] ([42.111.137.21])
 by smtp.gmail.com with ESMTPSA id j184sm18825984pfg.207.2020.11.16.00.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 00:21:41 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201115115409.14511-1-yashsri421@gmail.com>
 <CAKXUXMwMG0J6sPMbf1vx+e-g5x_NWSehnae7uik32Woug2JLDg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <ed386f67-1436-8369-dd57-3bfbb870702f@gmail.com>
Date: Mon, 16 Nov 2020 13:51:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwMG0J6sPMbf1vx+e-g5x_NWSehnae7uik32Woug2JLDg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	ASSIGNMENT_CONTINUATIONS
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

On 15/11/20 8:48 pm, Lukas Bulwahn wrote:
> On Sun, Nov 15, 2020 at 12:54 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently, checkpatch warns us if an assignment operator is placed
>> at the start of a line and not at the end of previous line.
>>
>> E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
>> deadlock on hotplug") reports:
>>
>> CHECK: Assignment operator '=' should be on the previous line
>> +       struct netvsc_device *nvdev
>> +               = container_of(w, struct netvsc_device, subchan_work);
>>
>> Provide a simple fix by appending assignment operator to the previous
>> line and removing from the current line
>>
> 
> Looks reasonable to me.
> 
> Lukas
> 
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index c9aaaa443265..5b1a5a65e69a 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3542,8 +3542,13 @@ sub process {
>>
>>  # check for assignments on the start of a line
>>                 if ($sline =~ /^\+\s+($Assignment)[^=]/) {
>> -                       CHK("ASSIGNMENT_CONTINUATIONS",
>> -                           "Assignment operator '$1' should be on the previous line\n" . $hereprev);
>> +                       if (CHK("ASSIGNMENT_CONTINUATIONS",
>> +                               "Assignment operator '$1' should be on the previous line\n" . $hereprev) &&
>> +                           $fix) {
>> +                               # add assignment operator to the previous line, remove from current line
>> +                               $fixed[$fixlinenr - 1] .= " $1";
>> +                               $fixed[$fixlinenr] =~ s/$1\s*//;
>> +                       }
>>                 }
>>
>>  # check for && or || at the start of a line
>> --
>> 2.17.1
>>

I have found an unhandled case with this fix ie if the line before
this line is not an added line(ie '+') rather removed one(ie '-').
Eg, with commit aef833c58d321f09a

I will send a modified patch handling that case as well.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
