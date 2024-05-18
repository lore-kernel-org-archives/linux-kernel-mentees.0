Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB11BA33
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 May 2024 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716012049; cv=none; b=qv7b3J8pHANzNxYCbc1UToTSmah3HcsQza4xv1SjrDbLZZ5HVdUGXvcQdYKJjhZggOR3S/cexSp/vTRRASbqLyCsnpDt5w0VhYE4UaJcRPdMMY+QmLo+f8AP1p5sk3tV3Ogsm7gAtDrbyMGY0tI7Vqsoe4qWMMOIoWL2etkVsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716012049; c=relaxed/simple;
	bh=iPVwY+FLQJN/2C/In5skBXJrWKGZ7CLLiR6TcZqpUcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6iecz5nI6XPgukNxCT6PEz3HMKqi3cEmyfpF/slIR0q5ttUx5+QCtW6RuyefaZ48kFLY7GmZHsSsfZbGcm39c/OTp1y40wZybI9PRbk3yHU2XPPpUdRN+tt3jZus15DVJSBq7QwX4jaM00rkDYTF9c27WsrhQ8wtyj/fnaPfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWipOTG2; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWipOTG2"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4104A401FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 May 2024 06:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9opp7yxj72y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 May 2024 06:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B89F5400AB
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B89F5400AB
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mWipOTG2
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B89F5400AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 May 2024 06:00:45 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ee42b97b32so29663835ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 May 2024 23:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716012045; x=1716616845; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2UEI9fgxAaUwQb09cLy2ONzt7BSkEaSUgAIAN/09lw=;
        b=mWipOTG2OHn7UUetrFomxP57BCI+4SlwoMz9L/N6pzJXBYh/zUuB7lokMs0El5rPKk
         aXNtR+v7VVa1rxhZIsqxMkFm/knPYXu3tfk5+XbO7OrJRdeJLqvqZ+pf7y6+m4zySOan
         Qv/mSDIzFsAlHNVSKoDNo1OAqByaUp7Q1GWsAnxN7+1HxStrlC08pl32KWFqPKi8qHmS
         vUlhG2z7D3GThdX+49ZguDSb4Sa5HM2Alx5bA+S3GjhN6W44fWhEYkyZxo6NPTg15qEh
         1nyUs5RrfqwEUS/GNOv9sftSRKsgnPfzQSXtqrV44rPIRhhnycl4IiHEjIc/qBI5Hx2m
         jmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716012045; x=1716616845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2UEI9fgxAaUwQb09cLy2ONzt7BSkEaSUgAIAN/09lw=;
        b=IdjzeqYZQb/p1Z/jJYHUyNwWJlH9tMgQomqvhNHgpCwQyTLdQAnN6N8q7A4AqQpt8c
         YFwr7JMtfj8i8jRO5FIfLheIP61aImJhpMDSKAKQRWjkaYDPG1n0YQXcZ86bSASdxIWQ
         IrgclvkPyNLuUyuLWVZwfYCkRMBODv9trkC+xyEma2fX2o2erlmlX2GvTuNzmDl+VgYL
         cf6JjPgXLwnhkd0JVMUWCn4bO44YC/1yNXA37qJWfUvI9HmpGz3Z6jyxTUrKKNfGxHBx
         L7Ptrc0xmCZ9KMq2c61fEm6sb78TZZ5AuYp89Ofq6kGZtS9tqbhdO5t6UVJYu3ne0AvQ
         3Kjw==
X-Forwarded-Encrypted: i=1; AJvYcCXAeJCSQZWOI1jwCQ+ZxJOneZrGQatjXa6a7GuigvWp9FsPTypPn+yj05qBWS6Yup5LwhiPYPFNMx+6LcqBzr8y04VPpqmMZuNec5fgeOzwGzRGP4gg/ph77zIhf5L7
X-Gm-Message-State: AOJu0YzHIaOM4VT9DOnQm06tXxuezlF8W8Pp3hmL+WeJpe61EYZCNnt7
	lKViqjRaf1WvZWncQvRjsU8/BSDgdIdk2GKAxHWMO2bwxvPgEf/1
X-Google-Smtp-Source: AGHT+IHGQXL2vAX8CQ2cBc+7aBoKlt4Ku42AcF7oUx9sqTlVMsGFxj6YPilu4ncfGFmuHtEizpkYvQ==
X-Received: by 2002:a17:903:24d:b0:1de:f91:3cf3 with SMTP id d9443c01a7336-1ef43f4d284mr244213975ad.55.1716012044866;
        Fri, 17 May 2024 23:00:44 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136838sm167030095ad.232.2024.05.17.23.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 23:00:44 -0700 (PDT)
Message-ID: <b2537aa6-4c00-4c47-862a-0e706ebbf305@gmail.com>
Date: Sat, 18 May 2024 15:00:41 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] line6: add midibuf init failure handling in
 line6_init_midi()
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, skhan@linuxfoundation.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240516174737.415912-1-yskelg@gmail.com>
 <8734qg260i.wl-tiwai@suse.de>
 <a258b613-3697-4f21-a8fd-20b276f63132@gmail.com>
 <871q608gz7.wl-tiwai@suse.de>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <871q608gz7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/18/24 2:51 오전, Takashi Iwai wrote:
> On Fri, 17 May 2024 19:10:44 +0200,
> Yunseong Kim wrote:
>>
>> On 5/17/24 5:32 오후, Takashi Iwai wrote:
>>> The allocated object is already freed by snd_line6_midi_free() that is
>>> called via rawmidi private_free at its destruction.  So your change
>>> would lead to a double-free.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>
>> Thanks for the review Takashi.
>>
>> I have one question:
>>
>> line6_midibuf_destroy() have no NULL check for the memory to free.
>>
>> If line6midi->midibuf_in is in this->buf = NULL from
>> line6_midibuf_init() with memory allocation failed,
>> won't the free(NULL) when accessed by snd_line6_midi_free() to
>> line6_midibuf_destroy()?
> 
> free(NULL) is fine, it's defined to be noop.
> Many codes just call free() unconditionally for that, as it reduces
> the code size.
> 
> 
> thanks,
> 
> Takashi

Thak you Takashi, I've been studying the kfree behavior in detail since
you mentioned it, so thanks for advicing the details.

Warm Regards,
Yunseong Kim

>>
>>>> ---
>>>>  sound/usb/line6/midi.c | 9 +++++++--
>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
>>>> index 0838632c788e..abcf58f46673 100644
>>>> --- a/sound/usb/line6/midi.c
>>>> +++ b/sound/usb/line6/midi.c
>>>> @@ -283,13 +283,18 @@ int line6_init_midi(struct usb_line6 *line6)
>>>>  
>>>>  	err = line6_midibuf_init(&line6midi->midibuf_in, MIDI_BUFFER_SIZE, 0);
>>>>  	if (err < 0)
>>>> -		return err;
>>>> +		goto error;
>>>>  
>>>>  	err = line6_midibuf_init(&line6midi->midibuf_out, MIDI_BUFFER_SIZE, 1);
>>>>  	if (err < 0)
>>>> -		return err;
>>>> +		goto error;
>>>>  
>>>>  	line6->line6midi = line6midi;
>>>>  	return 0;
>>>> +
>>>> +error:
>>>> +	kfree(line6midi);
>>>> +	return err;
>>>> +
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(line6_init_midi);
>>>> -- 
>>>> 2.34.1
>>>>
