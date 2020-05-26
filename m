Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767E7C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 13:58:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD412086A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 13:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dH/zxctH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD412086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1327F87722;
	Tue, 26 May 2020 13:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hDW+B9GSxglj; Tue, 26 May 2020 13:58:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B60287708;
	Tue, 26 May 2020 13:58:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0560BC088D;
	Tue, 26 May 2020 13:58:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E81AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 13:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2B0898612B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 13:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKkqv_-mGvQQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 13:58:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 85770860F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 13:58:52 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z3so16307556otp.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XWqm20ortSoNX+nbX7a42upA+Vp64e+AVN09KF9Ad8M=;
 b=dH/zxctH3oJeLyU5L+BqkAe7IuarlhEZvNhoE61BAaOVZQYyWBIx6XMKPEj9Q2xMWP
 ZsEFnhvFyiLx3H8BBdfGDHVnBXtNyuTxECLTFxOv9e6JXEKggaRuPijgIy8jOBVnTLmg
 810kGA3cnWAe5bxBSO7qekFipcvZXgBSCLPGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XWqm20ortSoNX+nbX7a42upA+Vp64e+AVN09KF9Ad8M=;
 b=PkCpCwiQOyEgmG4sviZhcWcZXm5ELV5d/lj8D8XxykQyvg/O8I0/GDA/p3wVtBFiXN
 qsE0DQFy+QgYi89UcThpAGyZqzlaL1LX2Exm1vaAJb1Z0thYenO3Eisw0a59miFJw++7
 o2BsRHwI3f+FgR3zuS9DQf2YSksSPIUgrGk+pZifu+Rdfk5Ko1eB5bqCYqMIsqIoTBVQ
 O/7ymYT2Ri4cR40VliHeSyEf6bDPibC63aKXQg7ILvmZ0KC3x4w6mdR5qgobxZH+Biba
 9+Qje+gDw5QZdjybxoRCa2Nz0vM7WiS6XiaQ7s5YnQ0pJFe4zQwB+VA4aBrz0TQJRNiH
 EMRQ==
X-Gm-Message-State: AOAM53390oNd4v+dvHYQ3/0pxAVyQX7d+sqxM0clTprP2Ij9GRYi6ZAX
 frJ6kztL4ZYdQW1Ovvh2VgEuuQy2
X-Google-Smtp-Source: ABdhPJz+/zK5moeWMtUn69a8IIKjkkhGLNDtnmG2OwfD8yave3Ngp7r9TvkVF/HxgAP9kKH0Uj/a2A==
X-Received: by 2002:a9d:2da8:: with SMTP id g37mr932324otb.293.1590501531610; 
 Tue, 26 May 2020 06:58:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id d19sm10979ooa.48.2020.05.26.06.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 06:58:50 -0700 (PDT)
To: Vitor Massaru Iha <vitor@massaru.org>, shuah <shuah@kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>
References: <20200414230950.83665-1-vitor@massaru.org>
 <CAFd5g47CaeEBiJsiSUtihHQF+OGpfCg76dS2ys2mwy2qn_L5-w@mail.gmail.com>
 <c035d65b-7e93-f948-22f9-73a56193ec36@kernel.org>
 <b04934ab91fd57e6df35279ad8a2619afb00b452.camel@massaru.org>
 <6403abc0c60fcb5069e1cdea0bb7f25b6dc8070f.camel@massaru.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5599cbd7-2c2d-7035-deea-25e6e0da407e@linuxfoundation.org>
Date: Tue, 26 May 2020 07:58:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6403abc0c60fcb5069e1cdea0bb7f25b6dc8070f.camel@massaru.org>
Content-Language: en-US
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RESEND] kunit: use --build_dir=.kunit
	as default
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 5/25/20 8:27 PM, Vitor Massaru Iha wrote:
> On Mon, 2020-05-25 at 22:52 -0300, Vitor Massaru Iha wrote:
>> Hi Shuah,
>>
>> On Fri, 2020-05-22 at 16:40 -0600, shuah wrote:
>>> On 4/16/20 5:11 PM, Brendan Higgins wrote:
>>>> On Tue, Apr 14, 2020 at 4:09 PM Vitor Massaru Iha <
>>>> vitor@massaru.org> wrote:
>>>>> To make KUnit easier to use, and to avoid overwriting object
>>>>> and
>>>>> .config files, the default KUnit build directory is set to
>>>>> .kunit
>>>>>
>>>>>    * Related bug:
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=205221
>>>>>
>>>>> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
>>>>
>>>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>>>>
>>>
>>> Applied the patch to kselftest/kunit on top of
>>>
>>> 45ba7a893ad89114e773b3dc32f6431354c465d6
>>> kunit: kunit_tool: Separate out config/build/exec/parse
>>>
>>> from David's work resolving merge conflicts. Please check if it is
>>> sane.
>>>
>>> thanks,
>>> -- Shuah
>>
>> The kunit branch had some problems related to identation. KUnit's
>> code
>> has mixed identation, and with that, in conflict correction, it ended
>> up breaking python.
>>

Thanks for sanity checking my merge.

>> In addition I found a bug: related to the creation of the
>> .kunitconfig
>> file inside the default build directory.
> 
> This is actually related to the other patch "kunit: use KUnit defconfig
> by default"
> 
> 
>>   Should I send the patch again?
>> Or do I make a bugfix patch?
>>

Please send the fix.

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
