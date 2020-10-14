Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AB2C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 11:14:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AD1207C3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 11:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ofsg01VI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37AD1207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD83D87D1A;
	Wed, 14 Oct 2020 11:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTA3F4uXxUHP; Wed, 14 Oct 2020 11:14:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 367A787D01;
	Wed, 14 Oct 2020 11:14:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 211C9C07FF;
	Wed, 14 Oct 2020 11:14:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41DBDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 11:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3DCE087FE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 11:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvdgaNcT5XNX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 11:14:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8B9FF87CBC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 11:14:12 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id n14so1777876pff.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=43x3rKcA2RyvqYiM6kbwL04G0XHRff3aQFwR3Tk95j0=;
 b=Ofsg01VIqtGta8qTAhXBMpCT5/mtiFiUuxL51MlYGqzMY7QgRpwuE6vWvJGk4/qnQj
 jiiLioo7k1XTq4qCfR+r8bBT7xQyPTx06lj7s1unv/dNrpIEXK2ZYP30rRSd8PQspUrf
 Yp7QVkgnz+h1Tn5S0BfVuMZUysIasWo03AUK5uwkjr/JGGK2X3pEkj1AYfUXPOLuctPI
 SdWykLU989sp+1SqVdEMa7P28TK50WOew1CqL8tJL4uB9gd1EHhq09FhbkmpsSxMp0uc
 ezKtskKYmnnAONmyIwvn506ixdp7NLl98jRspmGRYD7UwydhpEHC7IsoAwrTABzgowZF
 ULLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=43x3rKcA2RyvqYiM6kbwL04G0XHRff3aQFwR3Tk95j0=;
 b=Pxncnn6ttXs71gm8qgQ2G9zL6AoUC8r/doRpPwEsb/QGZysWMIOdcpUUusUAGXQwLl
 E3Njbxn4Zr7qKC5mZ6zUH7vDgKxD7ucRZgV5A1R0O1nw4wfgkiSf9gn4oAQXqNc4+344
 jLeVWWWkXeSVCeYG67Bf1pCVhEmlehmaCPTeaKx5/6Lb1RbtH4DoAsT3NhO7/tHgY0QZ
 +XoI37uYynCTTmD2ngIIN8n5OJ+TxLWkKQ3nXHYH0Z3c8qUzeKpgr1U7cNj2bjiep6/P
 vUN46JQUaPGo2qs0i4JLXdXUs3xVeWTCzPqvA8VhurxUZ2i9et0DDROJu/k7SBk/KmzR
 M54g==
X-Gm-Message-State: AOAM533MAJPz9JBH8LonI1CD2VrXk9dmAJ35loB2JDXKFOqiWYnKWch8
 GPSKNoAIXH7kyXm839m5wZrcZiysOG75ewu5
X-Google-Smtp-Source: ABdhPJyBfeSMBAFaa0Rs/TBYcwJvnYQzn0er8KZob1Tl2FQ88Rmo8DA/RB06vimCYn/tlWPmqby8dA==
X-Received: by 2002:a62:7f81:0:b029:152:6197:f1f2 with SMTP id
 a123-20020a627f810000b02901526197f1f2mr3860145pfd.49.1602674051626; 
 Wed, 14 Oct 2020 04:14:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id jx17sm2745454pjb.10.2020.10.14.04.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 04:14:10 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <d04f2b9c-e3e7-e68b-55c0-5444dae1746b@gmail.com>
Date: Wed, 14 Oct 2020 16:44:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010140734270.6186@felia>
Content-Language: en-US
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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

On 14/10/20 11:16 am, Lukas Bulwahn wrote:
> 
> 
> On Tue, 13 Oct 2020, Ujjwal Kumar wrote:
> 
>> checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
>> files. The script leverages filename extensions and its path in
>> the repository to decide whether to allow execute permissions on
>> the file or not.
>>
>> Based on current check conditions, a perl script file having
>> execute permissions, without '.pl' extension in its filename
>> and not belonging to 'scripts/' directory is reported as ERROR
>> which is a false positive.
>>
>> Adding a shebang check along with current conditions will make
>> the check more generalised and improve checkpatch reports.
>> To do so, without breaking the core design decision of checkpatch,
>> we can fetch the first line from the patch itself and match it for
>> a shebang pattern.
>>
>> There can be cases where the first line is not part of the patch.
>> For instance: a patch that only changes permissions without
>> changing any of the file content.
>> In that case there may be a false positive report but in the end we
>> will have less false positives as we will be handling some of the
>> unhandled cases.
>>
> 
> I get the intent of your addition. However:
> 
> I would bet that you only find one or two in a million commits, that would 
> actually benefit for this special check of a special case of a special 
> rule...
> 
> So given the added complexity of yet another 19 lines in checkpatch with 
> little benefit of lowering false positive reports, I would be against 
> inclusion.

Yes, it is a subtle change.

> 
> You can provide convincing arguments with an evaluation, where you show 
> on how many commits this change would really make a difference...

Some statistics:

I aggregated commits which involved 'mode change' on script files.
Totaling to 478 (looked for logs of only executable files in the repo).

At current state,
checkpatch reports 26 ERRORS (false positives)
with 'hashbang' test we have 5 false positives.

Without 'scripts/' directory test, 
checkpatch reports 82 ERRORS (false positives)
with 'hashbang' test we have 35 false positives.

> 
> It is probably better and simpler to just have a script checking for
> execute bits on all files in the repository on linux-next (with a list of 
> known intended executable files) and just report to you and then to the 
> developers when a new file with unintentional execute bit appeared.
> 
> Keep up the good work. I just fear this patch is a dead end.
> 
> There is still a lot of other issues you can contribute to.
> 
> Just one bigger project example: Comparing clang-format suggestions on 
> patches against checkpatch.pl suggestions are fine-tuning both of them to fit to 
> the actual kernel style.
> 
> Lukas
> 

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
