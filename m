Return-Path: <SRS0=2gri=FL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BB6C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Dec 2020 14:58:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC12023601
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Dec 2020 14:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC12023601
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 415B38709F;
	Mon,  7 Dec 2020 14:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOH_GFuj5b6x; Mon,  7 Dec 2020 14:58:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0DB8687099;
	Mon,  7 Dec 2020 14:58:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECBE0C0FA7;
	Mon,  7 Dec 2020 14:58:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C928C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 14:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 613642E257
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 14:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6+MKCncY3wi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 14:58:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id A758A2E255
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 14:58:11 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id h7so55395pjk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Dec 2020 06:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UN/ekVUFanSmZN/TOAiD2MrWLeWmrYn0gZuDaQp0A9o=;
 b=dhQklf+lhFd/8BZZlpSblpg6vsGdCsyfTI9wtiOgVHMaCQg24L2FDviAgue5hJrhgz
 BRk6ygtA3UNqxNwuyFWnrCEKxseTRFNlxrPhdQoEsDGGXJn7ocO6+zuks54ccgPHYnRp
 y5w40qB+VyEWVnlY88jddsNy8ryQ859Tq3xgvmn79tDbdHOY/GRA9s9dQgOfXlfiD3AV
 ZLb8Cb21obZTZ9/GKCf46/NAbUUqNayAasT2mYKPfDxpLqWXLdX5VZnv8p53MPRG8Ilx
 4kk/raKQfUQX7UNpBVjdITR4i7LQvSpaWBS+v7OVzhw3zenJfD9b0EY01BJ/qEs9SCWY
 5Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UN/ekVUFanSmZN/TOAiD2MrWLeWmrYn0gZuDaQp0A9o=;
 b=Jh9xhrAHr6Pw1qwL6HTOnPur7mI0bvYoYWsSTgQIA5vFv/91CVufU6zyo8hIvwJnNV
 38DmNg3RGNr2IAeK3yx7PsDAzKBTlD4NPNKSZFRPZVB7xX/iZiBjvWq29XeoKkiqIm+n
 VsZraTkYP+wf/hLwTagjgJhoN0NvPyUR73oxQ2e6PPBM1AgfXkrcwS6Flqz3Vs/0pEKY
 iqQKqjOKp9fof72oBo4JmZXxhAB5QdiYUIFpI1hBf0u3YqFDsDsmjNfE5wER2usED9VT
 BTqMQgMeLL6rsinBxxTfE1v+UVsmMXE5xe+k+lPg5wM2wieAgeZA+bXIJz2ju/d7MENT
 xnKA==
X-Gm-Message-State: AOAM530xAScOCZOJEZa6LlP5ru2+v4YHFNkb0xo7xZsDCclrqTXyRgWw
 xyrK4TkBQEkq7agUCtYtfZPTMd0gzQjXEw==
X-Google-Smtp-Source: ABdhPJyt5cmLn55aozIf+qHdZZ9H8F8a9RwxucY3z7zHfLDnyYzuZLO95sn4WBaUJmlfKkJJzHkNgw==
X-Received: by 2002:a17:90a:2e84:: with SMTP id
 r4mr1991980pjd.147.1607353090702; 
 Mon, 07 Dec 2020 06:58:10 -0800 (PST)
Received: from ?IPv6:2402:3a80:405:9e9e:1071:c250:5e01:a402?
 ([2402:3a80:405:9e9e:1071:c250:5e01:a402])
 by smtp.gmail.com with ESMTPSA id w131sm5439931pfc.46.2020.12.07.06.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 06:58:10 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201207124302.17128-1-yashsri421@gmail.com>
 <CAKXUXMxyP9ZhqGihktJcL1rpdbHZW7xCrK3-WmLV=k4gFMo3tQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <fbb2d894-6431-64ce-e952-11a6f5c83c63@gmail.com>
Date: Mon, 7 Dec 2020 20:28:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxyP9ZhqGihktJcL1rpdbHZW7xCrK3-WmLV=k4gFMo3tQ@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	CONSIDER_KSTRTO
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

On 7/12/20 6:24 pm, Lukas Bulwahn wrote:
> On Mon, Dec 7, 2020 at 1:43 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Checkpatch recommends the usage of kstrto* over simple_strto* and
>> strict_strto*, as these are obsolete.
>>
>> E.g., running checkpatch on commit f79b3f338564 ("ftrace: Allow
>> enabling of filters via index of available_filter_functions") reports
>> this warning:
>>
>> WARNING: simple_strtoul is obsolete, use kstrtoul instead
>> +       long index = simple_strtoul(func_g->search, NULL, 0);
>>
>> Provide a fix by replacing simple_strto* and strict_strto* with kstrto*
>>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 7b086d1cd6c2..ca5bb5a3f8f6 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -6980,8 +6980,12 @@ sub process {
>>
>>  # recommend kstrto* over simple_strto* and strict_strto*
>>                 if ($line =~ /\b((simple|strict)_(strto(l|ll|ul|ull)))\s*\(/) {
>> -                       WARN("CONSIDER_KSTRTO",
>> -                            "$1 is obsolete, use k$3 instead\n" . $herecurr);
>> +                       if (WARN("CONSIDER_KSTRTO",
>> +                                "$1 is obsolete, use k$3 instead\n" . $herecurr) &&
>> +                           $fix) {
>> +                               my $kstrto = "k$3";
>> +                               $fixed[$fixlinenr] =~ s/$1/$kstrto/;
>> +                       }
>>                 }
>>
> 
> Does this only warn on added lines?
> No, currently it does not seem to check for added lines. However, I
don't think we need to check for added lines as we are just
substituting in the line (ie no addition or removal)

> The fix looks good; I just do not know if the rule is applicable in
> full generality.
> 
> You might want to check a few instances if that rule actually makes
> sense and is accepted.
> 
I checked for the use of all three formats of function (ie
simple_strto*, strict_strto* and kstrto*) for all the files.

The total count of usage of kstrto* is 2854, whereas
for simple_strto* = 867
strict_strto* = 7

This is the complete list of files with their count of occurrences:

For kstrto* =
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/consider_kstrto/kstrt.txt

For simple_strto* =
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/consider_kstrto/simple_strt.txt

For strict_strto* =
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/consider_kstrto/strict_strt.txt

What do you think?

Thanks
Aditya


> Lukas
> 
>>  # check for __initcall(), use device_initcall() explicitly or more appropriate function please
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
