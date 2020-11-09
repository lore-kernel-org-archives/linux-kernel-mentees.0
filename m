Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884B1C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 14:33:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09993206D8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 14:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+MQc87o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09993206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B22B7869A5;
	Mon,  9 Nov 2020 14:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVP499UKiLoX; Mon,  9 Nov 2020 14:33:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 497EB867DE;
	Mon,  9 Nov 2020 14:33:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B606C088B;
	Mon,  9 Nov 2020 14:33:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46312C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 14:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CEAE87024
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 14:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVfH301EART0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 14:33:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9974686EB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 14:33:45 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r186so7319546pgr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 06:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fttcQMLons3nPiplvI+EVt+bwrkEoscAEstouSW2knI=;
 b=R+MQc87oFFKukvbIbZcg5w9QTw5OzNeYHAXGgW1/wMrhLRiFVccsKIw7IOnI5Woatn
 XYSitidY5b6mONZgEIEioTA5E3VBK2p1EJLn8eEOQ3QPfjm6l823A+Pkpxw3GqSV+L0z
 Pjx1XAYIdfc3+HyBtn3kfXOXm36UTvNlbdl9/krM5WQHFFEwQZ16+NAOQmsotH7uUpJ2
 rjZohu+lRZvaCfcrUZW3eX99+hOEgU8BgVAakwV2ORpTvuKMFop7ZtLrAMq0I/L4teQX
 FEDLT/HAK/FjZ0SgFr3r4uW7XeTDqi3VH2DxleCf5XQsoeFWPr/PF0P3ylFZPlDSO3xU
 15gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fttcQMLons3nPiplvI+EVt+bwrkEoscAEstouSW2knI=;
 b=rT0h0GEoUkmd+caHkYSzfi8gcsJSMidzqXSp7Fv0+pdVyhWmWp+s2F7VGoFf9Sr4lO
 e0MAA/5qwzp+O0AkArl1Au7wr0cEk6fc9dw+1a3WXj/L1sWSTeDk1RIq+/7X5be5vYiR
 FSjQIaNlKN/AOuzpQcfboJQudPGn0xJrmNvQvyZwbWZCxSd0PAooxPhhwAmjZZxU5dK8
 /t3IYAvsWTVw3twf+/DEEto7nwm9ORSZ0cV1CFMfxDTuyicgJDIs5W1qqn5phicSS0cA
 2B/ZzciucVCj7ZG+INlfCebiUSMG/ytup3dR1BNDZaR3loENplwijZNe4EQgzd8Hz6ak
 VaNQ==
X-Gm-Message-State: AOAM532V/NcDb4cJcAwfQpDxBHcfHYoQ8rnhK6abkZRPldwFto5+RWKf
 b8aNqOfNmvhtYuk0V8pURmA=
X-Google-Smtp-Source: ABdhPJwgxTev4N430m8iHlabone+fLGYWZenMvWWLz2xIcU9cvizSrACw7jaE56W+/idyR3NXgrXvA==
X-Received: by 2002:a63:c55:: with SMTP id 21mr12436487pgm.392.1604932425087; 
 Mon, 09 Nov 2020 06:33:45 -0800 (PST)
Received: from ?IPv6:2402:3a80:415:19be:b84e:68cf:38c6:95bd?
 ([2402:3a80:415:19be:b84e:68cf:38c6:95bd])
 by smtp.gmail.com with ESMTPSA id a128sm8110445pfb.195.2020.11.09.06.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 06:33:44 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201109131040.19266-1-yashsri421@gmail.com>
 <CAKXUXMyVqjG+XvZ+dnB=3NEnGcNOtcYFW2r5cJ3KCEzTE35rXQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <292a3930-9515-2387-40d3-63a14a61250b@gmail.com>
Date: Mon, 9 Nov 2020 20:03:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyVqjG+XvZ+dnB=3NEnGcNOtcYFW2r5cJ3KCEzTE35rXQ@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

On 9/11/20 7:10 pm, Lukas Bulwahn wrote:
> On Mo., 9. Nov. 2020 at 14:10, Aditya Srivastava <yashsri421@gmail.com>
> wrote:
> 
>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>> for the patch.
>>
>> E.g., running checkpatch on commit f68e7927212f ("Revert
>> "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
>> reports this error:
>>
>> ERROR: Missing Signed-off-by: line(s)
>>
>> Provide a fix by adding a Signed-off-by line corresponding to the author
>> of the patch before the start of diff(s)
>>
> 
> Can you please provide an evaluation first?
> 
> As far as remember, the fix is often not to add a Signed-off-by: tag but it
> requires something completely different.
> 

I have generated the 'git logs' of the commits causing
MISSING_SIGN_OFF at:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task7/summary_log.txt

Actually this fix was suggested by Joe at:
https://lore.kernel.org/linux-kernel-mentees/e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com/

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
