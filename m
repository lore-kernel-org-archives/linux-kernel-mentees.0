Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D9326D69
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  6 Jan 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702684; cv=none; b=itNNodZ3iDStbNanGW3NxEz4yzAGU5HHmqAW7Eo4DwJLcN0f9N5Tw2/a16WH6vi6+WZ9nks9fCjlfDJ4xqktdrDJuuvZ0MEa5wpPa1gnhn79Z17WjMKC2bzekn9Xx2AUGoEOxkIG+obMkXIPhozQ4CsYV4bOGfrT3O6LjbOUY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702684; c=relaxed/simple;
	bh=qD8hj/e6z16uKWh1w4gLB+YgxeA8Uk3YdEu2DzlXjDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJuWJ4uDRpg33xzeWyupkciOkSNG5fKrvJJJWg9qnxENPhgy/xvua7W+txJ/rfu1vvwoYTd25S5eqNpIRHbfbMDzpGAhkT8TNatxQ8g9/gLheJakKjKFWEj2aOBfyg93kq4cyAwX7EcqUsMaaD4pe7dJLSkiDsIIwoAdikZ8dqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rcoYGbTZ; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rcoYGbTZ"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7cdd651c884so575907a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 06 Jan 2026 04:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767702681; x=1768307481; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9rhcERV84OCmGmDX1M4WvV3XbLq3vCBRVDBIovbxsA=;
        b=rcoYGbTZJGIDtghJBOPF7cHrRsKrqd0ssmdQTqCJEfnflkTP01kp1myhfsFIizwAC8
         NGOPjk5vNNvmRIv0+1FrRFY7eL0Q+SWdB56MuEEYMqdJMqmYDRJXKgds0uSMqx4mpmOF
         mtDYRcykqWiUcjDL3+MyR3E3dXp+NSAi9kYcNQvgKzSLe2czozQgSdlGwdHE7e4n7WTL
         B33GMYTslwh3CWq92NaBo4Pr5eD1KeT0DU4PAv+mNt0bZCumfEzq5JaRlZz5lKJBClg4
         cjCPgjlSywkSb/VGVypFFlEu/4KIf3JrIeBG/sOO4NrkeUSGR6LM9D3TRcZ92ZqNalv8
         CILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767702681; x=1768307481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9rhcERV84OCmGmDX1M4WvV3XbLq3vCBRVDBIovbxsA=;
        b=VlrQ0jSZvRcxf5E1Fhl7KRY8GYxHx5QilXx/BJY7HQzYBUXHWMJfAkmlmHor/iLT9g
         HfeisS+Y0HApcbNYvonO0hsOnd7D+iHRHkM3BOY1agQf86t2VSu0TS3CPmUFutmra5nR
         IMPViLvmnMD4D9QXumFuymbRLq2dVd8wPixVl0dAE5pdsVNMu38BVrwUnmhn+X3Avfob
         p1CRzcFCkewV2w5vgRpV+3Kd4fQeZxR/A0bc1RTVTR0S8CwTTTAPaas9y/cO1sbkqqjn
         BtpuhGce/tDi79FDa4zgRzN/ywKlfGruC+HkivEDLIVYR7X4y7zy55xatxoxnbrGhHkb
         XMCg==
X-Forwarded-Encrypted: i=1; AJvYcCVne60TUteQvX4Q269XRDytKFukJldVObm93ZrrqCea3QuHyHqll38AdxlTR/T15afMcxorOdLV/D35HUpp4rWdOnDLEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPA+ObLv+VF7ub5BwvrtQ34hfF5wZZ5zPwn1EElClTiHTBoCEK
	fyN5Tym8cksBtROVvngybpsp+p6zQJ/amkPIRT53sFxohRzqyHT5wolxY+NJ0j5ByLU=
X-Gm-Gg: AY/fxX6wl+AT/hKVDBIzXB2DDUkQwJM/Sm44L+s9h2Gl2/uh4tPN9/+vQ/i/PfedMTy
	ZpSBtL8xSzqKwMuP8nySnf9RHFsQKHNgy0PL0LWT7nNE3ciblqYwuaLstjOv1XjOKOs2JOZ7zum
	PfU4mZLxxx+/wKK4uiuMHUcXd9HT7XktRLz4MvPK64xEDggEUmn6+N/Gek52MrJdO/UY50qb7iJ
	jZFjIPUH1+EZdtc5tP1oodyOsQdjPhDSLp/ixXKeYTBCHbY4JaiWovtneN78cLxJxzNH7AchO8V
	9iScWKRDd228pqdohHm6GR0rsIadhFiGkxmeeEC9ptonA7PbxX5p710wdrrgtmiSUW9gyRR1AB/
	D9JFpdqE6UIqpYx4ZNpge1iwPS+VD9gKy5OG11dOBNYzAaqYAcQhf/u6WE0Vy+3LyUwT5h6ZywD
	iYnHFqc65F
X-Google-Smtp-Source: AGHT+IH5Yiil0wcxvs9oiN90uHex83YlxafWRtrKx9Wzl/T3/UdFMXwlQhRkTvju9BYVuVbHAMuVlw==
X-Received: by 2002:a05:6830:83a2:b0:7cd:f5dc:56ea with SMTP id 46e09a7af769-7ce46c33c90mr1505197a34.4.1767702681615;
        Tue, 06 Jan 2026 04:31:21 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8besm1321261a34.14.2026.01.06.04.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 04:31:20 -0800 (PST)
Message-ID: <9a687e88-7cf2-49ae-8b79-1b87a21c070f@kernel.dk>
Date: Tue, 6 Jan 2026 05:31:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] loop: don't change loop device under exclusive opener
 in loop_set_status
To: Jan Kara <jack@suse.cz>,
 Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Cc: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <2crvwmytxw5splvtauxdq6o3dt4rnnzuy22vcub45rjk354alr@6m66k3ucoics>
 <20251217190040.490204-2-rpthibeault@gmail.com>
 <f45muigy6nwxtbfbxidbqyru73qtntuqfby6lgnt32c6eyyov6@eg2mbf6pncq6>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <f45muigy6nwxtbfbxidbqyru73qtntuqfby6lgnt32c6eyyov6@eg2mbf6pncq6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/6/26 5:08 AM, Jan Kara wrote:
> On Wed 17-12-25 14:00:40, Raphael Pinsonneault-Thibeault wrote:
>> loop_set_status() is allowed to change the loop device while there
>> are other openers of the device, even exclusive ones.
>>
>> In this case, it causes a KASAN: slab-out-of-bounds Read in
>> ext4_search_dir(), since when looking for an entry in an inlined
>> directory, e_value_offs is changed underneath the filesystem by
>> loop_set_status().
>>
>> Fix the problem by forbidding loop_set_status() from modifying the loop
>> device while there are exclusive openers of the device. This is similar
>> to the fix in loop_configure() by commit 33ec3e53e7b1 ("loop: Don't
>> change loop device under exclusive opener") alongside commit ecbe6bc0003b
>> ("block: use bd_prepare_to_claim directly in the loop driver").
>>
>> Reported-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3ee481e21fd75e14c397
>> Tested-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
>> Tested-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
>> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> Jens, ping?

Now applied. Heads up in general, don't nest v2 or later inside the
original thread. It just makes emails get lost, as it appears part
of the original discussion.

-- 
Jens Axboe

