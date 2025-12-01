Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0062327E05E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 20:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622671; cv=none; b=ff0nKHlnuaRd7qwpXb3jBKvalsG8NJfjGqii28Ak7QHJ4R0iVB+NHpTktg6StPc8Tm9ZG5xAh67JVXVb027UNwPlYgjPXs2vV/DJtWPagPprnLkwSu+X/CUIBnPH3dAZ83whY0tdRk9xncgVoNgmKZlKXppqiv6h0eEkbDZKbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622671; c=relaxed/simple;
	bh=RR8IKPDdT/N+QTKF/hycBW2eHsDa/n0AE4zi6Yb+Tzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t60NRGLwhl1esef23PgAC6V5+vymJ2N/jPKdLEAGisMOgABIWPjqNKW76MtKNUvsT9UxWDboGERYopg1b7QbZ0qkdloAp8JtOR8WnkkFsb3Hw3njnRi70nDuZ+4eatcYKI0zxvI723ygpYuSfmUEU8kFJkpjf5Lq3RB0DJdQ10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcPpHkOC; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcPpHkOC"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB1440810
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 20:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FS-eYolMikC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Dec 2025 20:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86741407E7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86741407E7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KcPpHkOC
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 86741407E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 20:57:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-640fb1e568bso838930a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 01 Dec 2025 12:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764622665; x=1765227465; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OFedbJSpL58e0RTrVWPjou9i/940/3k3Vgwi2rinVU=;
        b=KcPpHkOCh+EnBs5qQbGMXz3Dwj5SG/UaziN2gvVeMBWf4f1TkFzzvmG3M1YrRYn3gt
         9voemE0UnJW4g9hQKfe+2fSWgoQDFgbknZM7aUM2mPTlRlr444zu3POCRuwSavtJ/6v2
         499p5gkt2rpDPnOp/SAX7OkNqnKDBR0chegn4S3xla53WDcnLbMp1QZpWb/QT42IZLZ8
         GpWR+PbFopbq6p+zUgpVN16FJGfqSGPkqKb6o0pUUSYl3N1X2Pr25PfwFhlXt86to/Ho
         yv8G1tQ7sWR9uU+J/+DIQcjzgWOVZuvHuvryQtZzqN2+9y4PzTsxTOCs7o/Mr5brUROs
         xz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764622665; x=1765227465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OFedbJSpL58e0RTrVWPjou9i/940/3k3Vgwi2rinVU=;
        b=cbpj1UK8ux0Bks2evTxktsq97VZzEo/bClL60nQNdC/t/8gtHdErNT60h7etDavlBK
         Si5dwJoiA1dggaxsVKxj4rpX8xb0BbUX8gDaZ9c9TMH39/mVS8Cv2NTZX60/+ZtfO/Z/
         lxuQge9/+d04RViopzcyNVO7nRXBqMdOTHfmBR207uNaBlIdjz44O/AT4iTAxD6Qqfnp
         fSxOsHWqqw7PRivwAcAoXkAP/ZbHnxxxO7K/TcVVXT/eUJo8dDWBCeFE5r8ycNA/tYXx
         IjME8GR2U8njM0n4R+4K5Sl6NEdqSZygcgJj1dFTY6n+6AtUwQP+1eyTo7o5GgPPX0fN
         OnLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOX80uqQpRLrhjvLt7lwoDDFNIZjQDUnWVDM6r5KjpQvSEhNJ+Z1a6SwtHIG6iSJ1plgtOUVQcIjkIn4vQuq0qOCcsLQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxYz6vBeNLo/R/qWTsFTsY+n0cgBysxfewLF3UeOrrYyyPD7rsp
	aeX7QInN0myWXJwR8vfhwcANoW3D703cl+y04+IfVRpuju1uSorM6ToZ
X-Gm-Gg: ASbGncs9Sk4+2yIVXXak5cXSBcGq4GiL0/xuDvCe4Lw6p77+1KN1n+Z1bikv8tFgGru
	/373tOrFqyYf0jltrLkMIOAxfWc9ZVjJTY9fmg/7nDgIoVFhIaJV4lepAhFIRrpV86CCbKRYy5U
	SnXkKVGz158ZJAhQ0km3+FZEtCLTfk0tyUlUKur19TgxRcI0EgULBuGlPIGw45xhwB8YIg9H9mH
	ncQbdwDBcHptFXV+QhyMAkSKpYqK2GYTmpdoElvOMA5tsHBMDNpMayXuFT++BVph0yU0FzD5vA4
	ytPixQSNjPxunJx4eswm+t5XC4Ry1XACu6YCqlbykAw1j0PkOAawBKcyfboGwXVhdA4lLImKx2H
	aG4NVEJ1YOjK1cPgX5IAfwTCp0HKbTiCewdX5jLvLDAaMjwqzxESJcEz2U4X99gI0JIzrgx3+8O
	FaZjgnYp2sRrUpTxS+OXekHEJyukhBBA==
X-Google-Smtp-Source: AGHT+IGzeYN3NmcKEOIwCNxKJBu/knwzVFsKXz8xRU7G/BscC8ZK2mSahsI4czsqVHvOg1OjJoOqQg==
X-Received: by 2002:a05:6402:278a:b0:640:abd5:864f with SMTP id 4fb4d7f45d1cf-64559ffd9ebmr20972093a12.4.1764622665132;
        Mon, 01 Dec 2025 12:57:45 -0800 (PST)
Received: from [192.168.1.105] ([165.50.39.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c8577sm1287946466b.30.2025.12.01.12.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 12:57:44 -0800 (PST)
Message-ID: <830d05e6-9117-424f-9a94-25c358d087c7@gmail.com>
Date: Mon, 1 Dec 2025 22:57:41 +0100
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
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com"
 <syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
References: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
 <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>
 <20251126-gebaggert-anpacken-d0d9fb10b9bc@brauner>
 <04d3810e-3d1b-4af2-a39b-0459cb466838@gmail.com>
 <56521c02f410d15a11076ebba1ce00e081951c3f.camel@ibm.com>
 <20251127-semmel-lastkraftwagen-9f2c7f6e16dd@brauner>
 <4bb136bae5c04bc07e75ddf108ada7e7480afacc.camel@ibm.com>
 <59b833d7-4a97-4703-86ef-c163d70b3836@gmail.com>
 <9061911554697106be2703189f02e5765f3df229.camel@ibm.com>
 <2795a339-dc82-4a1e-8c97-87dd131a631f@gmail.com>
 <707dd64fa75fbc922cf921be46e7cf023d8bac59.camel@ibm.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <707dd64fa75fbc922cf921be46e7cf023d8bac59.camel@ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/25 9:37 PM, Viacheslav Dubeyko wrote:
> On Mon, 2025-12-01 at 22:19 +0100, Mehdi Ben Hadj Khelifa wrote:
>> On 12/1/25 8:24 PM, Viacheslav Dubeyko wrote:
>>> On Sat, 2025-11-29 at 13:48 +0100, Mehdi Ben Hadj Khelifa wrote:
>>>> On 11/27/25 9:19 PM, Viacheslav Dubeyko wrote:
>>>>>
>>>
>>> <skipped>
>>>
>>>>>
>>>>> As far as I can see, the situation is improving with the patches. I can say that
>>>>> patches have been tested and I am ready to pick up the patches into HFS/HFS+
>>>>> tree.
>>>>>
>>>>> Mehdi, should I expect the formal patches from you? Or should I take the patches
>>>>> as it is?
>>>>>
>>>>
>>>> I can send them from my part. Should I add signed-off-by tag at the end
>>>> appended to them?
>>>>
>>>
>>> If you are OK with the current commit message, then I can simply add your
>>> signed-off-by tag on my side. If you would like to polish the commit message
>>> somehow, then I can wait the patches from you. So, what is your decision?
>>>
>> I would like to send patches from my part as a v3. Mainly so that it's
>> more clear in the mailing list what has happened and maybe add a cover
>> letter to suggest that other filesystems could be affected too. If that
>> is not preferred, It's okay if you just add my signed-off-by tag. Commit
>> message for me seems descriptive enough as it is.
>>
> 
> OK. Sounds good.
> 
>> Also I wanted to ask 2 questions here:
>>
>> 1. Is adding the cc for stable here recommended so that this fix get
>> backported into older stable kernel?
>>
> 
> I think it's good to have it.
> 
Okay I will add it to both patches

>> 2. Is it normal to have the Reported-by and Fixes tag for the hfsplus
>> patch even though the reported bug is for HFS? I guess it's under the
>> same of the discovered HFS bug so it references that?
> 
> So, we haven't syzbot report for the case of HFS+. However, you can consider me
> as reporter of the potential issue for HFS+ case. And I assume that Fixes tag
> should be different for the case of HFS+. Potentially, we could miss the Fixes
> tag for the case of HFS+ if you don't know what should be used as Fixes tag
> here.
> 
I will make sure to adjust the patches's descriptions as you have 
suggested and I will be sending them tonight or early next morning.
> Thanks,
> Slava.
> 
Best Regards,
Mehdi Ben Hadj Khelifa

>>>

