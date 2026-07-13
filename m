Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B634EEE5
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 04:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783918679; cv=none; b=KFMahBxMhFbnPsGuTVmPxXc8yBqXcEOgbqUQf2goLS3dytn+eAOMLCrp9wbtXFzaT/69/ReErRlZ6ql6enhMRiNWSuNuk3dl1GngpGpJJGJRTrtlML/KAFhMP+fFwKdy4pi4tbbo/IbQ1zHfUunXDJ3ihKNcc18YCD2ksobrTG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783918679; c=relaxed/simple;
	bh=LflzoFEAZCGohBe6+8suK5icx8InddD6Nep0mFpxNEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkAdDUNcFJAp+rAGCUVKurQT7Fca1VInrSl+X2LlJAwyI8MxF06EUPplD0S6rl5cv2WqXSCAvr2W3ok6Q2j0vAHjwCjvBVhgG4liEveBQmQK7tFu+vvIVLkmip5ixir1YYuWRJakpirkMOx4jAnjUqnTN1rT55kkwfWzP/4uqEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyRQNuqv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyRQNuqv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so22887985ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Jul 2026 21:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783918677; x=1784523477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2Wy8lwvqhiTKT55Dm2cNnX9AvjqZigx9HgdgElZQis=;
        b=pyRQNuqvbiv6G29TZok7eZOaejvQWs4IOToXdgbux4E6grDSppV9FTS6Et4mHiDeSh
         oKmykKZz9L0M+0hRbJK9/S5n0+Q4ly4qs5X42thnCcl2UsFkW6ZJSUMyHTwQfPhHaiiW
         b46p0ifBA08YtS0xeNuUkRZDkjLl44HlsQ7xoGdpHhV/e4s89daDJwo38GQcEr923aFP
         3WFF87YMG7+YmvfQodTkajBLQAJnQBZT11+Tz3654A7VIGYN5p8tYszJ7sBjzthAOjzb
         HpHfdkUUv+i60syf8NfnkyGndAmXh+MD1KgJqQZ1mg+zdMH4CD30qKGmC3TeTfIxl7VB
         YMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783918677; x=1784523477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2Wy8lwvqhiTKT55Dm2cNnX9AvjqZigx9HgdgElZQis=;
        b=TW1cK5yzIH2F0ioVlrzMRa0bepg8ZPkxpqKAOh5wIfZcYClGGHawWK7llQ5af6sKtQ
         +aHW8d0NwJMlaKnsQyQY9DVDV8fSmG2hzwWhuag3rxVdrV84bNwWRa4VajYLlsqIPIRI
         frPZNw4XDUZe649LsgEIiG+Y4ro30u2jqdmojGHH0LKw31m76XjjLf5lSwss1MrvWWkN
         dISnymh4HZXi+blYwo5JfQmA6YrdBWlL/TzdZvJwhl8uANxc+xzci9Lk+ywTD/Mb2YTB
         RDVltiLK/7lFUlWOSI9dZztQ/UaAffz8wIt6EmAKAcnmouuGC2OHvzyupkqm5ZeWOfk2
         3CgA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2zshmVWzuU58D8SQITKlSb3u2s7tmT0v5lOBwCEbAjEbOgOGXwRNfafKUoLtIgn08JVirCC+WVNP36cX9dK11V6sy7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz49z7X7P5MaUMryqJBPNfCvnwF19hd6MJVAobMIiqtbauVL3Hm
	Vsta8WX5vyafl5FR1LXzYTGiIEEebwccZG7Y/Vavu3GGhrrKDNqnp7fP
X-Gm-Gg: AfdE7cnMO+tF9Sw5PUH3zswARBftwt3jFlZ24Wb4dQR1uinEfN8afFy3FttyBXW/fsE
	4hSdXtot55O6AhUBJcxQLYFMx2qvhvtDd0/o5WrNd2hrLew7M6nWOLaVuHs4KXhG0YFyktBcJX/
	6JyerkKMJ2kOW6m0AP1BsWBIHUqUjLp1+ZSjbUwnWWs/KdqwYWCn/1A5fGseiEXW8vP6pS54DRo
	Yggpwsk950oupx7wpj9D9zJ7EtfPrdiRHkviTyE+lsvR0dboV1B31xSTg1mJaFyt5vGG9ngh5P4
	fBpsG/bwLmm3ik/1cDl4SNPk0g5QpnJGWwbvkOdj3hWbRN/RCKdFk5r501VSWPsv2h7B3Ac5c14
	hxk8L9/HwnWR6gaZhMGRwr4ZNjAuaW4bXS7guCiFeqT69QxFPm9HMWew20knIU4eZgh4fk05jVG
	2+jMaRbf113NYa8YfMvxVtR6KW2EcILgbhzSirAah2Vq+za4MzszHahlNZwneZF1Xz3rFZvnwFJ
	NjFpn9C373GzZU=
X-Received: by 2002:a05:6a21:4d8f:b0:3c0:9c1a:894f with SMTP id adf61e73a8af0-3c110b33403mr8347974637.71.1783918677163;
        Sun, 12 Jul 2026 21:57:57 -0700 (PDT)
Received: from ?IPV6:2001:fb1:db:5c33:7066:708a:3018:7aec? ([2001:fb1:db:5c33:7066:708a:3018:7aec])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cabc7b2aa4bsm2033582a12.10.2026.07.12.21.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 21:57:53 -0700 (PDT)
Message-ID: <79f36674-5a35-4aaf-b5b1-bc6189c222ad@gmail.com>
Date: Mon, 13 Jul 2026 11:57:46 +0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Use seq_buf for string concatenation
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 shuah@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com,
 jkoolstra@xs4all.nl
References: <20260622094623.18469-1-woradorn.laon@gmail.com>
 <20260629143947.2216574e@robin>
Content-Language: en-US
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
In-Reply-To: <20260629143947.2216574e@robin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/6/2569 BE 01:39, Steven Rostedt wrote:
> On Mon, 22 Jun 2026 16:46:23 +0700
> Woradorn Laodhanadhaworn <woradorn.laon@gmail.com> wrote:
> 
>>  
>>  #include <trace/events/sched.h>
>>  #include <trace/syscall.h>
>> @@ -4500,14 +4501,20 @@ static void __add_event_to_tracers(struct trace_event_call *call)
>>  extern struct trace_event_call *__start_ftrace_events[];
>>  extern struct trace_event_call *__stop_ftrace_events[];
>>  
>> -static char bootup_event_buf[COMMAND_LINE_SIZE] __initdata;
> 
> Keep the above string and just assign it.
> 
>> +static struct seq_buf bootup_event_buf __initdata = {
>> +	.buffer = (char[COMMAND_LINE_SIZE]) {},
>> +	.size = COMMAND_LINE_SIZE,
>> +};
> 
> static struct seq_buf bootup_event_seq __initdata = {
> 	.buffer = bootup_event_buf;
> 	.size = sizeof(bootup_event_buf);
> };
> 
>>  
>>  static __init int setup_trace_event(char *str)
>>  {
>> -	if (bootup_event_buf[0] != '\0')
>> -		strlcat(bootup_event_buf, ",", COMMAND_LINE_SIZE);
>> +	if (seq_buf_used(&bootup_event_buf) > 0)
>> +		seq_buf_puts(&bootup_event_buf, ",");
>> +
>> +	seq_buf_puts(&bootup_event_buf, str);
>>  
>> -	strlcat(bootup_event_buf, str, COMMAND_LINE_SIZE);
>> +	if (seq_buf_has_overflowed(&bootup_event_buf))
>> +		return -ENOMEM;
>>  
>>  	trace_set_ring_buffer_expanded(NULL);
>>  	disable_tracing_selftest("running event tracing");
>> @@ -4766,7 +4773,7 @@ static __init int event_trace_enable(void)
>>  	 */
>>  	__trace_early_add_events(tr);
>>  
>> -	early_enable_events(tr, bootup_event_buf, false);
>> +	early_enable_events(tr, (char *)seq_buf_str(&bootup_event_buf), false);
> 
> The above then would be:
> 
> 	seq_buf_str(&bootup_event_seq);
> 	early_enable_events(tr, bootup_event_buf, false);
> 
> Don't typecast a const char* to non const.
> 
>>  
>>  	trace_printk_start_comm();
>>  
>> @@ -4794,7 +4801,7 @@ static __init int event_trace_enable_again(void)
>>  	if (!tr)
>>  		return -ENODEV;
>>  
>> -	early_enable_events(tr, bootup_event_buf, true);
>> +	early_enable_events(tr, (char *)seq_buf_str(&bootup_event_buf), true);
> 
> Same here.
> 
> -- Steve
> 
>>  
>>  	return 0;
>>  }
> 

Thank you, Steven, for your review. I've sent v4:
https://lore.kernel.org/all/20260713045249.69942-1-woradorn.laon@gmail.com

Thanks,
Woradorn
