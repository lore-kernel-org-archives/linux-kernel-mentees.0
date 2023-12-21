Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FB05990E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHANXGk/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A784760A89
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 17:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A784760A89
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HHANXGk/
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEbNQzBzvCFl
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 21 Dec 2023 17:18:56 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B6D4A60A62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 17:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6D4A60A62
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6d7f1109abcso693145b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 09:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703179136; x=1703783936; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GucZi/0eLj2KLmDczAGmirTTkcTPsJL8Mdp3MQ1fLr8=;
        b=HHANXGk/FfW/n28LLlSwL1PCSns3VzAf8EgWXepf8ANWJGzgAzbd8z/uZm0C0vbxUH
         nw100eCsiyYDb2YHn7PwFPGHJbtCVa5u09fzDD3s3wO5Iv90QmeVYtQ/MSIEi5CSJ7eQ
         bkYLieIvLPF0/y7B+iqdxq7zE3wxug+LDepGXtZHRuCbRQsMCsax32D79/wvMkoKwvkI
         R7e8Wsd3XgEONS3PhLExqaU6qJnjvwRR3GyUd/wnKRjPB1TOBgaYeCYn8jsGbNfao2OU
         HwkUaaPwqtnlnoIJtT0J79F/ARZRYaECKvZef+ZgbYidkZMdivSqKdzmK0pHJWn52OfC
         xg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703179136; x=1703783936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GucZi/0eLj2KLmDczAGmirTTkcTPsJL8Mdp3MQ1fLr8=;
        b=Jfglxn0LZZRoK4WrXa1CGSY1YRUOAZkp9SI2ISwfv8yXY9duA8lBtQMtaDvMT15DeQ
         TP6Jie7RvCI6X+jv0PPItdhg4FNW8RZwnZjY7bSD9esVUWPChwd8RjGG4ikXmcm12lua
         9nGHeLYEHZwcy+UrwOps29fMTXYCJelE+PtEO8cgfIJVrLdTYXmvHKtTv8x9QSL/xzhF
         fY4WJHXG7oOynagSQTxEHiY/mTDFGPzosWDOaZyzsmCgEqfhNRtGA3m9jU9xOqls3H+4
         Wc40sqpXoZsvLy4Ib7bQM08D7XJROo5R7cIxMwhGR6HGiSO30452Qaaqs19JEd5ooJ8B
         D87w==
X-Gm-Message-State: AOJu0Yyv8NNTcz9vTeyzH7y4VytOZlaVFuJ2Z9DVaha+MVPJRO5n57wF
	I7TaOr2zGWUjyZwc0IRCdXU=
X-Google-Smtp-Source: AGHT+IEeCRWRbBOYdA7fTrUDLwKOq1ZKzI/dPLcjt/EHedF2BFZkNiy5Wi4EgToMWcsNsn02atUwrQ==
X-Received: by 2002:a62:ee19:0:b0:6ce:7748:575d with SMTP id e25-20020a62ee19000000b006ce7748575dmr10180885pfi.61.1703179135636;
        Thu, 21 Dec 2023 09:18:55 -0800 (PST)
Received: from ?IPV6:2401:4900:5f28:c37d:9ad0:e7ae:52c2:c31a? ([2401:4900:5f28:c37d:9ad0:e7ae:52c2:c31a])
        by smtp.gmail.com with ESMTPSA id x30-20020aa79a5e000000b006cc02a6d18asm1849647pfj.61.2023.12.21.09.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 09:18:55 -0800 (PST)
Message-ID: <d547f3cb-c03d-4871-b4c4-26dbb0a61495@gmail.com>
Date: Thu, 21 Dec 2023 22:46:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] iio: dac: driver for MCP4821
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231220151954.154595-1-anshulusr@gmail.com>
 <20231220151954.154595-2-anshulusr@gmail.com>
 <20231221170706.27f5b76f@jic23-huawei>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <20231221170706.27f5b76f@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/21/23 22:37, Jonathan Cameron wrote:
> On Wed, 20 Dec 2023 20:49:53 +0530
> Anshul Dalal <anshulusr@gmail.com> wrote:
> 
>> Adds driver for the MCP48xx series of DACs.
>>
>> Device uses a simplex SPI channel. To set the value of an output channel,
>> a 16-bit data of following format must be written:
>>
>> Bit field | Description
>> 15 [MSB]  | Channel selection bit
>>             0 -> Channel A
>>             1 -> Channel B
>> 13        | Output Gain Selection bit
>>             0 -> 2x Gain (Vref = 4.096V)
>>             1 -> 1x Gain (Vref = 2.048V)
>> 12        | Output Shutdown Control bit
>>             0 -> Shutdown the selected channel
>>             1 -> Active mode operation
>> 11-0 [LSB]| DAC Input Data bits
>>             Value's big endian representation is taken as input for the
>>             selected DAC channel. For devices with a resolution of less
>>             than 12-bits, only the x most significant bits are considered
>>             where x is the resolution of the device.
>> Reference: Page#22 [MCP48x2 Datasheet]
>>
>> Supported devices:
>>   +---------+--------------+-------------+
>>   | Device  |  Resolution  |   Channels  |
>>   |---------|--------------|-------------|
>>   | MCP4801 |     8-bit    |      1      |
>>   | MCP4802 |     8-bit    |      2      |
>>   | MCP4811 |    10-bit    |      1      |
>>   | MCP4812 |    10-bit    |      2      |
>>   | MCP4821 |    12-bit    |      1      |
>>   | MCP4822 |    12-bit    |      2      |
>>   +---------+--------------+-------------+
>>
>> Devices tested:
>>   MCP4821 [12-bit single channel]
>>   MCP4802 [8-bit dual channel]
>>
>> Tested on Raspberry Pi Zero 2W
>>
>> Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf #MCP48x1
>> Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf #MCP48x2
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> 
> I've applied this to my tree with a few formatting tweaks. However, timing is such
> that, unless 6.7 release is delayed, the merge window will open too soon for me
> to get another pull request in.  A such this is now almost certainly queued up
> for the 6.9 cycle in a few months time.  That's probably a good thing anyway as
> some people will already be on vacation and may want to take another look at this
> when then get back.
> 
> Applied to the togreg branch of iio.git and pushed out as testing for 0-day
> to take a look at it.
> 

Thanks for the code reviews and help in getting this and my other
drivers (ltr390 and ags02ma) ready for upstream. I wish to contribute
more in the upcoming year.

Best Wishes,
Anshul
