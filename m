Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D6C1A2C0A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 May 2024 05:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716011896; cv=none; b=DOfNoZKrWGciAi9wxH/e3oyJWglV31wWSTmMYMbGfd+0BHYBi618xzlIM4uKh5IBgUsD66nGB0sZNl6LnKr5ko/OnqzNBHGwqm4JifJfCUTE+dGVM14LuMm+ASr9xFAFLwq2VLXZ2Wdta/sOOvHP9Zlth9a8UNyL/2fOlKAF7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716011896; c=relaxed/simple;
	bh=ugRuViyFEPNBRrmZZ9sug9AkrtWkTDBbReRg8Nng84c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBIq1+5aMQefcUpqu2Sh7qth24HGal1rZWD2sxfe6EpCvFDYWp0OCP4vCWPRfyZxtvOM8kh6fA0mQqjxSkT7LumtKDAAwo9B+yTEDiDnavxwHdzHrj5s09AV8O+agor38Pn5ReNXTbFt+Md+/ozlb5EjD+NvLa6jYIzX8QUWyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNd8jCEQ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNd8jCEQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D95F40857
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 May 2024 05:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lguv7LHGsS6h for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 May 2024 05:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E10340816
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E10340816
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CNd8jCEQ
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8E10340816
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 May 2024 05:58:13 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso25188725ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 May 2024 22:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716011893; x=1716616693; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NpoWf0kPCPHx4qZHC3NR+sgkhHGRLiJPxCUCzupdh8I=;
        b=CNd8jCEQSsp2u7bdD/HQJK6RCgafLkF17R/aCBsndJDeKWjXM/DHmpoJM4G3waBUrV
         rLT+n9aMvbg5rc8jrjao32aHpx9kDF28+BdeAtRDGwjMtzdDMCfmR3yz47JJi5DAlh7N
         AJuG4R2CD4NnWEPqC9O7w/VOWxJGyDBRzxca4tJb0U8zZ3jfTTtX47SwT020cUyukjCa
         QgqzV0Bm9qItxq7DjTI5eLWSuFwrl3C6NseWBV1KVRM9wodWLZD37BbhiB+7PJuEapJB
         eKgX0e+09RTi47CPzzWnE8DY91tANELqxHlg0JWBdHFg8aWIOJdd4jJjXYYi0ShZYPs8
         ZDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716011893; x=1716616693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpoWf0kPCPHx4qZHC3NR+sgkhHGRLiJPxCUCzupdh8I=;
        b=iW8fCYglFbVud7fLwGIxZF9c3k4nfdKWjcwGCR7ms5PJvdzhRLuGzhvbtCzfBzmp0D
         FyFqt9dch7RmRVmM90L+klOMeK9BWplFsMZ38Zth4ucoMoAb6eJQWdhxOb27dGqiPEbi
         YQQZpFuzTqu39EtApu2qJpt74PnTinD1Srrw74nqvS85Mylu9NPjOZrAX/Wv+DQ8HyUa
         Xym1f94dQPU2ATi64YXU+nizg+OSiIbRPQq+nh4ZsDpQoH/+ECUgI1wYCulF4EVIiPvU
         seW/NPNLohijQNrI1vLp5Zb7x+S/M375mqcyquVkyF9QIIBgorxYBfsjXD+KWu4gs/Cd
         T0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsXuuuD/OcqfjoqMfE4jqKOGHliJ1IVhLTrzmGo9ezU3bJrIjpTb6yGsRuqC+V0V2012pyVTMsOSPD9pmNw7rXbAvACbwYNgvg4ih+aAzWWGEUwW5FdwbjfbI4B9ph
X-Gm-Message-State: AOJu0YwUKtFsIVAemHgKwyVuyiUlPs9xCJ9fOWi2oc3mwCwkp7SBQPXq
	deaX1if4R0h2CTfmugUVYF9gOUKgPIcSIiSA6b4nmHcBn6bV9DNN
X-Google-Smtp-Source: AGHT+IGcKN+aZvNtvPth44dcJoWcC+S2QgC7f/MO2/BNFqKqDZh2q+d6XXj89yqtZTH9iDzPIIkppw==
X-Received: by 2002:a05:6a20:daa8:b0:1b0:1a02:4136 with SMTP id adf61e73a8af0-1b01a024396mr11872218637.8.1716011892754;
        Fri, 17 May 2024 22:58:12 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62886d069sm18213737a91.25.2024.05.17.22.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 22:58:12 -0700 (PDT)
Message-ID: <659f274a-7152-4a6e-915e-6ed9f99d08cc@gmail.com>
Date: Sat, 18 May 2024 14:58:08 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] line6: add midibuf init failure handling in
 line6_init_midi()
To: Bjorn Helgaas <helgaas@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240517174426.GA2285947@bhelgaas>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <20240517174426.GA2285947@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/18/24 2:44 오전, Bjorn Helgaas wrote:
> On Fri, May 17, 2024 at 10:32:13AM +0200, Takashi Iwai wrote:
>> On Thu, 16 May 2024 19:47:38 +0200,
>> yskelg@gmail.com wrote:
>>>
>>> From: Yunseong Kim <yskelg@gmail.com>
>>>
>>> This patch fixes potential memory allocation failures in the
>>> line6_midibuf_init(). If either midibuf_in, midibuf_out allocation
>>> line6_midibuf_init call failed, the allocated memory for line6midi
>>> might have been leaked.
>>>
>>> This patch introduces an error handling label and uses goto to jump there
>>> in case of allocation failures. A kfree call is added to release any
>>> partially allocated memory before returning the error code.
>>>
>>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
>>
>> The allocated object is already freed by snd_line6_midi_free() that is
>> called via rawmidi private_free at its destruction.  So your change
>> would lead to a double-free.
> 
> I stand corrected, sorry that I missed that!
> 
> That said, it seems unreasonably hard to verify this path to
> snd_line6_midi_free().
> 
> Sorry for misleading you, Yunseong.

Thank you Bjorn for your detailed advice. I will take them to heart and
work on them in the future.

Warm Regards,
Yunseong Kim

>>> ---
>>>  sound/usb/line6/midi.c | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
>>> index 0838632c788e..abcf58f46673 100644
>>> --- a/sound/usb/line6/midi.c
>>> +++ b/sound/usb/line6/midi.c
>>> @@ -283,13 +283,18 @@ int line6_init_midi(struct usb_line6 *line6)
>>>  
>>>  	err = line6_midibuf_init(&line6midi->midibuf_in, MIDI_BUFFER_SIZE, 0);
>>>  	if (err < 0)
>>> -		return err;
>>> +		goto error;
>>>  
>>>  	err = line6_midibuf_init(&line6midi->midibuf_out, MIDI_BUFFER_SIZE, 1);
>>>  	if (err < 0)
>>> -		return err;
>>> +		goto error;
>>>  
>>>  	line6->line6midi = line6midi;
>>>  	return 0;
>>> +
>>> +error:
>>> +	kfree(line6midi);
>>> +	return err;
>>> +
>>>  }
>>>  EXPORT_SYMBOL_GPL(line6_init_midi);
>>> -- 
>>> 2.34.1
>>>
