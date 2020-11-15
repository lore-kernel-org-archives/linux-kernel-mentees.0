Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572B6C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 17:00:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDAB82244C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 17:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2Qg54II"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDAB82244C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83FC78722E;
	Sun, 15 Nov 2020 17:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d98aN8-1l6He; Sun, 15 Nov 2020 17:00:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A972487228;
	Sun, 15 Nov 2020 17:00:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91F4DC0891;
	Sun, 15 Nov 2020 17:00:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A145FC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8911D85742
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQm_wMQ0XBux
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:00:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D9BB98525D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:00:15 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q28so107574pgk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 09:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S8HmyRm+ccebjqAn0vqITc507hT7MgSWRZ9H3hVbmWs=;
 b=F2Qg54IIbEjWuX2TPaU6qpsLWpowE70oEiPDCFTKoh4QK8feNdIMQZCDQ9lMAxui3M
 foh3DbFnJ90En3UpOCppL+6kwrTW2WTFkuUFUOw0MrijDENAYWu9ZSEnywfd2P6qxmCY
 1AZ8ucv2TvGY71M3WmvbPhtsIV6kBZ7Nl2E5A4eX/H/b/gNuAMJglvrTLEAJXKjzCN9Z
 u4we0BHLTNwhMAqpftAvQw+s6lRYx+q3Zm4SkkGM9p9wEfP7rJgLbtsLWA1j8MLUvxuN
 RlCOKO4dGyhyO2ipoZRI9lufMexiUoSZWB20oyBboO9L+ZcY5hkXVMh92hRoUnMYEoOA
 9l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S8HmyRm+ccebjqAn0vqITc507hT7MgSWRZ9H3hVbmWs=;
 b=pubehlSeyzBSnYv9EulGQfs1WBS5/Xamvw99X8S4r3CiV1ubs6xtY1oDmRFTE9SzoE
 g7/MCul6X8U9+ngsCeaSNg2p78UwOilSDrHlf9MQ2wOaVKVEU1PB8xYCWhDI5vAm5sCq
 oWWDESgQT57MgaaRtF/iHzN393U6E0WxhV7f+rnOjWLCDgCYxf+7A0quhBsZ3xFlAyUY
 vzToh8ZnvqFOQo/2HYkBOdSSyNnSCsYnIJOAQQZpG8eJhLHXz/cwNlco7mQJJBv/FMnP
 UA9ZM2Gpk7cXbM1j3gf3KVYGlAzzHiep3r0y3+EP4Ztmz+UqJ4SV9IDA/I1xfq9o5QES
 cFUg==
X-Gm-Message-State: AOAM533POCeEEM95oLUuyHR2S3NPt4hb3r5Dg4Xdv5eT3bGxFjcIY6WK
 QBf4Q+V9zgslx0GMCp4FbuHFKGxQFwg=
X-Google-Smtp-Source: ABdhPJwhyvJa8wyZ8Fl0DjjnPzX5YL+Www6FfjyZqr6XCNp+ycuBMJD8qAA6rxTWLVfYdyfcFOLbMg==
X-Received: by 2002:a63:1959:: with SMTP id 25mr9818525pgz.201.1605459615056; 
 Sun, 15 Nov 2020 09:00:15 -0800 (PST)
Received: from ?IPv6:2402:3a80:403:5563:5d03:b10d:63ae:9ab3?
 ([2402:3a80:403:5563:5d03:b10d:63ae:9ab3])
 by smtp.gmail.com with ESMTPSA id e184sm15848317pfe.146.2020.11.15.09.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 09:00:14 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201112195840.5094-1-yashsri421@gmail.com>
 <CAKXUXMwREFprvpSnz++U18-HCQ8k9rw8z0swUvEsTDfu2EAN6g@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <7eb65dfe-5059-5513-1dc0-37364adb23d4@gmail.com>
Date: Sun, 15 Nov 2020 22:30:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwREFprvpSnz++U18-HCQ8k9rw8z0swUvEsTDfu2EAN6g@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On 15/11/20 8:55 pm, Lukas Bulwahn wrote:
> On Thu, Nov 12, 2020 at 8:58 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently checkpatch warns us for long lines in commits even for
>> signature tag lines.
>>
>> Generally these lines exceed 75 characters limit because of:
> 
> ... exceed the 75-character limit because of:
> 
> [yes, English is strange ;)]
> 
>> 1) long names and long email address
>> 2) some comments on scoped review and acknowledgement, i.e., for a
>> dedicated pointer on what was reported by the identity in 'Reported-by'
>> 3) some additional comments on CC: stable@vger.org tags
>>
>> Exclude signature tag lines from this class of warning.
>>
>> A quick evaluation on v5.6..v5.8 showed that this fix reduces this
>> warning by a frequency of 17.
>>
> 
> frequency is the wrong word here. It is simply "count" here.
> 
Okay.

> Also how many warnings were there before and how many after?
> 
> The count of 17 does not tell you much on the relative impact of the change.
> 
> 

So, before this patch, COMMIT_LOG_LONG_LINE had frequency of 1896 and
after the patch, it becomes 1879 (over v5.6..v5.8). Should I add this
information in commit message as well

>> A quick manual check found all the dropped warnings related to signature
>> tags.
>>
> 
> What did the quick manual check found?
> Do you mean the quick manual check found all ... to be false positive
> that should not have been warned about?
> 

Yes, all the dropped warnings are prefixed by signature tags.
Generated list:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/signature_tags/dropped/summary.txt

> Other than that, it looks good.
> 
> Lukas
> 
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index ac7e5ac80b58..f2369ac29d50 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2961,8 +2961,8 @@ sub process {
>>                                         # file delta changes
>>                       $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
>>                                         # filename then :
>> -                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
>> -                                       # A Fixes: or Link: line
>> +                     $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
>> +                                       # A Fixes: or Link: line or signature tag line
>>                       $commit_log_possible_stack_dump)) {
>>                         WARN("COMMIT_LOG_LONG_LINE",
>>                              "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
