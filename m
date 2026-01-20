Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221A942E009
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Jan 2026 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913540; cv=none; b=ZVGxfgBQ7nqxdFDab8qSp0Sa7UzwBIonCHdfRi6n62FDnyRhEyxO55wkk8z1Pgrr7sFZQYOQ1+SdU4E/oFF0G/jyvUBXImDimJ7JBpal3oNDC0GPJvSntC9QVggm386/MyPIn+Cn/7bKUjdsyDurzAouozNBUuITgg86cEp4X7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913540; c=relaxed/simple;
	bh=qwRTDcexgqB8UO6ImlZARduSMCBdN3aQSsAG3RPO/qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LijBV3/AEZC65jKHcOy5SKl1qRmUEOMxWJN5RhhEph3MbpxhGIB0ogdP/TH+2b0DQ806cBHwpH2ESAgz/XXJjvojZlh6L2t3VGsi2cGmjOocGrRAFYLlynDXJ8lXY7fYBIq48sD9d4oPCg9kf4ukA9VAe0jmw+wNeujGog0qLsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/85wsPL; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/85wsPL"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 999006FDA2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Jan 2026 12:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_Mw7HnWyHQx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jan 2026 12:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99B736FA31
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B736FA31
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l/85wsPL
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 99B736FA31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Jan 2026 12:52:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47ee26a760eso2068085e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Jan 2026 04:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913535; x=1769518335; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hohucwzV8N+oNhlDNJ0PPwzKcIESBcXAG4tNEyAv2Lc=;
        b=l/85wsPL8AM+fbmrBCkAIhqqMgXO/7L11b394nyc5VQIRjFh/OitUTn/dDrgcOfUC0
         qDj5FyYHC1/Y4YJtKvdUyB+c2APxws7uqQkXu4ixqaJN+9uLCsXy22wmTiTYI4lT7L7t
         IEDNS4kXp7TudysMdXKs8FgO0GqcDsfw6EmHSvXut5RIUrQyouWSJQ5d1g5qUX1heuAH
         QgEq7qL7gQAYABcqic8/vYPrGJdQXYf9c8yKOmIPDQRxrafqKkxboLACrREk+ERvJwze
         K21hqZr2kQvMDeNzmWHTxVMRBvnSg13UVHzeRD+cFyDoMBW2RTMyMT7msAPPbzDVMRFR
         ucTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913535; x=1769518335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hohucwzV8N+oNhlDNJ0PPwzKcIESBcXAG4tNEyAv2Lc=;
        b=p8sIv+RvXm0Vh3QSKJaAVCHOXKX3uzVzuEq3pOPIb4EET3cT1a7Wt0E4mfpSgaOLbt
         zrVsmLDMJEyPkdlw+lzQ7M45oDt7FBlpG/m3h28qpLc+Nw63kEWCLbmcWL51F2mKMqJd
         jAe2aNRc87IT86Pyc3Yi6nBD5yZflFqKbL3nliTq5H+kdiuhBYCApJuMc9qUgqQVQhVO
         Ag4SQ2wAFDJM1xQJokNCm5E92Y/NGcRqcxaz1fA/shfhVKp15+HBb2u93oqlDhnKdbyq
         X47OSrRGFmplwyq3brfSs7o3CWrf+AWsuPZDk3vv5ELPpnl5Iz4cqbO7K5applSyS2WI
         OufQ==
X-Forwarded-Encrypted: i=1; AJvYcCU50iJapGu0+lEYnbPg52RKEqf7kP//DEi80GUgEJJEv5P7BhCH9lzE8wTeUdIaoFLLd4n9yqtoWHdSzXizxlyiPTXbqA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy/kwhxO4ZIeOuwOtem+d1rrAdX9Zk+ONb5OopLIEpfkeTnh2I/
	m6YET3TFegqCfTS+px5WGlNxiXeMhHMyZbNMGMpPGEDYGu3rW+OE5/Sn
X-Gm-Gg: AY/fxX62dlI2BPspe5TKxOABPJwsHMW7MNAqCw9qsH3aNrN22uqTjFT+l6yZJF8CqCv
	JxoLMqHsQTibKdTwg4VyDyB/uBNUD7JeSVAJ7LwmQz9QJmW3XeD9vPyftWQmG2kG4CKopZpnTsX
	0POMTQLIRst7f5xfsu9gY6PJU8OQ3Bxw3rVyGHVSkRTMeWfsOyhx2jJRSgg8jAtX8FAjUoO2jwD
	Norg2haOkd31eEw/oltD6Tv4b9KIbHT99ozhHAstKsao1rVfkUeUQZLwaPV1sHfcIbvzK26AeG+
	a07dQ10QfE6YJRjv3+8N7LNZInPd3nzTg2mtTfLZI+a0kdYf8GLCaJP7XStoNdusT07Xy8jUWhQ
	HHlHF7E2I3mP9H+zNpDeywgOWm7IVl8Gm8wlaMF/Vvog46OJtoBPdhpDYpI4m2YCHXxeq0nzzB/
	GYfd27Tqs0/UBmddbX67/tJ36DO9GZW1ls/lgV9eQ=
X-Received: by 2002:a05:600c:828f:b0:477:7b16:5f97 with SMTP id 5b1f17b1804b1-4801e2a2216mr110600595e9.0.1768913535151;
        Tue, 20 Jan 2026 04:52:15 -0800 (PST)
Received: from [192.168.1.105] ([165.50.95.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43595e0a705sm1088207f8f.14.2026.01.20.04.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:52:14 -0800 (PST)
Message-ID: <cd4f1173-d5c3-42c1-8753-fb7b6c6ebad8@gmail.com>
Date: Tue, 20 Jan 2026 14:52:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 "brauner@kernel.org" <brauner@kernel.org>
Cc: "jack@suse.cz" <jack@suse.cz>, "khalid@kernel.org" <khalid@kernel.org>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "slava@dubeyko.com" <slava@dubeyko.com>,
 "david.hunter.linux@gmail.com" <david.hunter.linux@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com"
 <syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>
References: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
 <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>
 <20251126-gebaggert-anpacken-d0d9fb10b9bc@brauner>
 <04d3810e-3d1b-4af2-a39b-0459cb466838@gmail.com>
 <56521c02f410d15a11076ebba1ce00e081951c3f.camel@ibm.com>
 <20251127-semmel-lastkraftwagen-9f2c7f6e16dd@brauner>
 <4bb136bae5c04bc07e75ddf108ada7e7480afacc.camel@ibm.com>
 <59b833d7-4a97-4703-86ef-c163d70b3836@gmail.com>
 <9061911554697106be2703189f02e5765f3df229.camel@ibm.com>
 <7d38a29d-9d81-42e0-99c1-b6a09afe61fd@gmail.com>
 <8a96ddbefd84ed0917afc13f91ee0f33ea2e0c10.camel@ibm.com>
 <4e65ea7b-79aa-4c36-a8ea-0ca84966d089@gmail.com>
 <d714e0652f920cecebf5fdcf0023a440cbd1df4e.camel@ibm.com>
 <4d545c3f-50cf-4ad4-8427-35f87398838e@gmail.com>
 <1bfac55095419b8c5d9dd73dbf9b8b94c74b264a.camel@ibm.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <1bfac55095419b8c5d9dd73dbf9b8b94c74b264a.camel@ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/19/26 9:55 PM, Viacheslav Dubeyko wrote:
> On Mon, 2026-01-19 at 22:34 +0100, Mehdi Ben Hadj Khelifa wrote:
>> On 1/19/26 7:27 PM, Viacheslav Dubeyko wrote:
>>>
> 
> <skipped>
> 
>>>
>> I have ran xfstests on both my desktop and laptop on the for-next branch
>> for the repository that you have mentionned and I didn't have any crash
>> or issue. Here is the test results(identical for both desktop and laptop):
>> FSTYP         -- hfsplus
>> PLATFORM      -- Linux/x86_64 bhk 6.19.0-rc1-00008-ged8889ca21b6 #1 SMP
>> PREEMPT_DYNAMIC Mon Jan 19 20:53:58 CET 2026
>> MKFS_OPTIONS  -- /dev/loop1
>> MOUNT_OPTIONS -- /dev/loop1 /mnt/scratch
>>
>> generic/001  2s ...  2s
>> generic/002  1s ...  1s
>> <skip>
>> Failed 51 of 772 tests
>>
> 
> The 51 failed xfstests is expected situation. However, if you apply [1,2] on
> xfstests code base, then you could have around 31 failed xfeststs for HFS+.
> 
I have applied both patches and got the expected results on my desktop 
and laptop:
Failed 31 of 772 tests
I can confirm that indeed those patches fix 20 of the previously failed 
tests.
> Thanks,
> Slava.
> 
Best Regards,
Mehdi Ben hadj Khelifa
>> Many tests were skipped of course. If you want full output I can send
>> you that.But for now the issue seem to be resolved (for hfsplus at least
>> I'm not sure about hfs since I still can't test it on my system).
>> Thanks for your efforts slava.
>>
>>
> 
> [1]
> https://lore.kernel.org/linux-fsdevel/20260118180519.xdddwoke2tey6ogt@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
> [2]
> https://lore.kernel.org/linux-fsdevel/20251231224937.uu67l76cytcd36ns@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/

