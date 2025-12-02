Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15201307AF2
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  2 Dec 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666205; cv=none; b=WrV0RWE01ULYPP22AmYWyH7lYxx2W0cNAO9CCEyOjGlkdKDKPssNLqa4o58Fi8ZyHcmOBoNWqVf/6j9f3mStYHQ/Bjfk809nVddsEvs/kri7Bz22APmtopjYpFUG5MDXZYuJFigiLwwILO2W2KjL/4Z/ObbfVuBHNyqwegypKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666205; c=relaxed/simple;
	bh=Kxc3xymhYJf5rYA3ZiRBFHXTfPFg781MVylumAf2VB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFO7HAP6OCGn64VdlTvi34/5QPVt8U6OiDoHZAc2Iv5Jee7MFCSkZVZ1of2jX7k0A9KQz6auGpLD2g4K54Y1hLMEL8DxleYUAkkxva5NkHSpfVNezR2ljeRVLjz3DTPvGPjmGi6xlVTltm1nrKcYsYeFD7CA9oqlAYpMbtcQkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpOwgQQe; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpOwgQQe"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso5955220b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 02 Dec 2025 01:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764666203; x=1765271003; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUwxnFDkbLisSCXIciGjEpDUp8k4vSFIWpq6DQ0hRis=;
        b=RpOwgQQeuwnO0c4i7/o/JQgT+KEqCKsVBBrngKUodCET0XB51cgpodqqWX6Ov4xbKs
         4ihaDEvIXy8xBfFDeO+FJ3DsDVRcpKI/qYjNyxnP6AA6F72/CbplSvEte/qgLYqeYl/z
         Yh7yXwTScXA7RKpljhK4XBkj2JmIgpSaheGWyQYaX6NIkS3YEChLkyEB6td2FWXbTCR2
         qawloOyy+R9q55+3wG795qmxOuspqD1TZ29fbVylnxd+buK38iiO86+hJgTk9aulQ/eO
         y4iRabO+llIMLHt/b/wrN3yEFokdoBBLTp6zT9WomP6hE86BFOsM3WJirknUb4nrqxSn
         aD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764666203; x=1765271003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUwxnFDkbLisSCXIciGjEpDUp8k4vSFIWpq6DQ0hRis=;
        b=IMynZg5hD+D7RRljv7nCXtBuRLO9gysULDudwz95t9s4+Y/O9hS+sOFPsrW6yVG17C
         2yM2XIz7YVyciARPzOlybME69tR4TwtSv7HsAyVuwpYx3RDjybFnmxOkhT1i9jtq4AZf
         X1jvR50RFxkZI94AG5GGLN471jrEhZIzxaPjQ0OVQdUhR19Qn6LJqso1s5+bjywXy0Zv
         1P66W+kV0BhwY0BqZxr+1UpDfo1IB0s0z5Nm4r7NB1FjmmAjxc51o++TctuKaNWL1YVr
         RFr72W3KQiAyRKSxKJUfi/Kmm6a/kiqS2VygLr755yyr/hadhzwvZMsSvBbWLMin7cWS
         IVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTZGXVApy6t/FNOtpnxxr1dFdI7oIStJfsNYaW0E0+d5HwSjA5689PgbYLZejDkxrVO6mNMZSKGM3PcN7nhqnpoBNFsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwySPEXYctS6k9lk6Y4kTpea3Dd5RNvIQFdCqLt8CWeKaapD2bd
	fa7nPDNrFcfhP5tei7R3W0L3p0Gogtpm+7R8WTKdbD63xg0pEYQ4FAvm
X-Gm-Gg: ASbGncuIHjjQH0pxl1sTnC0bdMLdeaRI9TcSMCaonAKFz4SYT31OuV74T1TN/7sTrt7
	iL5c4n3Uxccsfpev7DDqTQYigoBVADUHQvPi+fBStpcq3OXjxzgjzoV4Lo+eja/yxujiY+byHkf
	unTIa3W5/EfpzGo5JtwVXphKGHTqle4gN2/t+A/ThjBBwuT7aHANxfOKypci/9PM0hPB1CZ+87a
	2Hy+3axMZS6PV9evKDew9OZ3m6a7hN7oXq2todCuHsbZqUAhP3ose+FmXOA9Yk/PjV+H70N/ULI
	pZ5vNRJNU0bVEZBSudPjIoQTDzZb0tqH7CdRXWofqRCeC+ahom3/cSI1XOtOUfIzGtBhWbvqPH/
	B3qkItNxa4rFb5/2Qf/BQv4+C1uX/C5kOyoQTZrGOs6gGlNb/dB1xI+NJXj+p61KFw8wizKxthj
	sx4DcUw/hvykILIb4JXjEnjwU/k7DofA==
X-Google-Smtp-Source: AGHT+IFLI8VC/mfV4i6+8S8PhOxrX54j/G5nldjMLpfgRiK7v1GagPZl3ft3/qYJdbFyDH0KLW3FPQ==
X-Received: by 2002:a05:6a20:9146:b0:343:6c90:77b5 with SMTP id adf61e73a8af0-3614eb83deamr48178691637.15.1764666203057;
        Tue, 02 Dec 2025 01:03:23 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm14671106a12.3.2025.12.02.01.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 01:03:22 -0800 (PST)
Message-ID: <7fac334b-17d3-4c48-8303-2d7e73ff281b@gmail.com>
Date: Tue, 2 Dec 2025 17:03:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] loop: don't change loop device under exclusive opener in
 loop_set_status
To: Jan Kara <jack@suse.cz>, Yongpeng Yang <yangyongpeng.storage@gmail.com>
Cc: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>, axboe@kernel.dk,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 cascardo@igalia.com, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org,
 syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com,
 Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251114144204.2402336-2-rpthibeault@gmail.com>
 <93a1773e-e30a-469d-bc8f-029773112401@gmail.com>
 <zoc2xguhdvjkon36d67usvf2wpufcreiti22sjgekhbhtkvdkp@iezwglvxdw4t>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <zoc2xguhdvjkon36d67usvf2wpufcreiti22sjgekhbhtkvdkp@iezwglvxdw4t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/25 20:38, Jan Kara wrote:
> On Tue 18-11-25 15:10:20, Yongpeng Yang wrote:
>> On 11/14/25 22:42, Raphael Pinsonneault-Thibeault wrote:
>>> loop_set_status() is allowed to change the loop device while there
>>> are other openers of the device, even exclusive ones.
>>>
>>> In this case, it causes a KASAN: slab-out-of-bounds Read in
>>> ext4_search_dir(), since when looking for an entry in an inlined
>>> directory, e_value_offs is changed underneath the filesystem by
>>> loop_set_status().
>>>
>>> Fix the problem by forbidding loop_set_status() from modifying the loop
>>> device while there are exclusive openers of the device. This is similar
>>> to the fix in loop_configure() by commit 33ec3e53e7b1 ("loop: Don't
>>> change loop device under exclusive opener") alongside commit ecbe6bc0003b
>>> ("block: use bd_prepare_to_claim directly in the loop driver").
>>>
>>> Reported-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=3ee481e21fd75e14c397
>>> Tested-by: syzbot+3ee481e21fd75e14c397@syzkaller.appspotmail.com
>>> Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
>>> ---
>>> ML thread for previous, misguided patch idea:
>>> https://lore.kernel.org/all/20251112185712.2031993-2-rpthibeault@gmail.com/t/
>>>
>>>    drivers/block/loop.c | 41 ++++++++++++++++++++++++++++++-----------
>>>    1 file changed, 30 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
>>> index 053a086d547e..756ee682e767 100644
>>> --- a/drivers/block/loop.c
>>> +++ b/drivers/block/loop.c
>>> @@ -1222,13 +1222,24 @@ static int loop_clr_fd(struct loop_device *lo)
>>>    }
>>>    static int
>>> -loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
>>> +loop_set_status(struct loop_device *lo, blk_mode_t mode,
>>> +		struct block_device *bdev, const struct loop_info64 *info)
>>>    {
>>>    	int err;
>>>    	bool partscan = false;
>>>    	bool size_changed = false;
>>>    	unsigned int memflags;
>>> +	/*
>>> +	 * If we don't hold exclusive handle for the device, upgrade to it
>>> +	 * here to avoid changing device under exclusive owner.
>>> +	 */
>>> +	if (!(mode & BLK_OPEN_EXCL)) {
>>> +		err = bd_prepare_to_claim(bdev, loop_set_status, NULL);
>>> +		if (err)
>>> +			goto out_reread_partitions;
>>> +	}
>>> +
>>
>> +	if (mode & BLK_OPEN_EXCL) {
>> +               struct block_device *whole = bdev_whole(bdev);
>> +
>> +               BUG_ON(whole->bd_claiming == NULL);
>> +       }
>>
>> I add the above code and do the following test:
>> # losetup -f data.1g
>> # echo "0 `blockdev --getsz /dev/loop0` linear /dev/loop0 0" | dmsetup
>> create my-linear
>> # ./ioctl-test /dev/mapper/my-linear // trigger BUG_ON, ioctl-test.c is
>> in attachment.
>>
>> The root causes of BUG_ON:
>> 1. When creating 'my-linear' device, the mode for opening /dev/loop0
>> does not include the BLK_OPEN_EXCL flag.
>> table_load
>>   - dm_table_create // get_mode() never assign BLK_OPEN_EXCL to {struct
>> dm_table *t}->mode
>>   - populate_table
>>    - dm_table_add_target
>>     - linear_ctr
>>      - dm_get_device // mode = {struct dm_table *t}->mode, never open
>> loop0 with BLK_OPEN_EXCL mode.
> 
> BLK_OPEN_EXCL is added by bdev_open() whenever it is called with non-NULL
> holder. And DM code (open_table_device()) calls bdev_file_open_by_dev() with
> _dm_claim_ptr as the holder. So all opens from DM should be exclusive ones.
> The question obviously is what is broken in this that your reproducer still
> works...
> 
> 								Honza
> 

Yes, I was mistaken. When loop0's whole->bd_claiming is NULL,
bdev->bd_holder is set to _dm_claim_ptr by bd_finish_claiming. When the
my-linear device is opened with BLK_OPEN_EXCL, its ioctls are handled
normally. If the my-linear device is opened without BLK_OPEN_EXCL, the
ioctl call returns -EBUSY, which is the expected behavior.

bdev_open
     - bd_prepare_to_claim //whole->bd_claiming = _dm_claim_ptr;
     - bd_finish_claiming // whole->bd_holder = bd_may_claim; 
bdev->bd_holder = _dm_claim_ptr;
         - bd_clear_claiming // whole->bd_claiming = NULL;

Tested-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Yongpeng,

>> 2. When 'my-linear' device is opened with the O_EXCL flag, and an ioctl
>> is issued to it. The dm_blk_ioctl function calls bdev->bd_disk->fops-
>>> ioctl(bdev, mode, cmd, arg), which passes the mode with BLK_OPEN_EXCL
>> flag to lo_ioctl.
>>
>> 3. loop0 was not opened by dm_get_device() in BLK_OPEN_EXCL mode. As a
>> result, whole->bd_claiming is NULL.
>>
>> Thus, the BLK_OPEN_EXCL flag in the mode passed to lo_ioctl doesn't
>> guarantee the loop device was opened with BLK_OPEN_EXCL.
>>
>> How about use per-device rw_semaphore instead of 'bd_prepare_to_claim/
>> bd_abort_claiming'?
>>
>> Yongpeng,
>>
>>>    	err = mutex_lock_killable(&lo->lo_mutex);
>>>    	if (err)
>>>    		return err;
>>> @@ -1270,6 +1281,9 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
>>>    	}
>>>    out_unlock:
>>>    	mutex_unlock(&lo->lo_mutex);
>>> +	if (!(mode & BLK_OPEN_EXCL))
>>> +		bd_abort_claiming(bdev, loop_set_status);
>>> +out_reread_partitions:
>>>    	if (partscan)
>>>    		loop_reread_partitions(lo);
>>> @@ -1349,7 +1363,9 @@ loop_info64_to_old(const struct loop_info64 *info64, struct loop_info *info)
>>>    }
>>>    static int
>>> -loop_set_status_old(struct loop_device *lo, const struct loop_info __user *arg)
>>> +loop_set_status_old(struct loop_device *lo, blk_mode_t mode,
>>> +		    struct block_device *bdev,
>>> +		    const struct loop_info __user *arg)
>>>    {
>>>    	struct loop_info info;
>>>    	struct loop_info64 info64;
>>> @@ -1357,17 +1373,19 @@ loop_set_status_old(struct loop_device *lo, const struct loop_info __user *arg)
>>>    	if (copy_from_user(&info, arg, sizeof (struct loop_info)))
>>>    		return -EFAULT;
>>>    	loop_info64_from_old(&info, &info64);
>>> -	return loop_set_status(lo, &info64);
>>> +	return loop_set_status(lo, mode, bdev, &info64);
>>>    }
>>>    static int
>>> -loop_set_status64(struct loop_device *lo, const struct loop_info64 __user *arg)
>>> +loop_set_status64(struct loop_device *lo, blk_mode_t mode,
>>> +		  struct block_device *bdev,
>>> +		  const struct loop_info64 __user *arg)
>>>    {
>>>    	struct loop_info64 info64;
>>>    	if (copy_from_user(&info64, arg, sizeof (struct loop_info64)))
>>>    		return -EFAULT;
>>> -	return loop_set_status(lo, &info64);
>>> +	return loop_set_status(lo, mode, bdev, &info64);
>>>    }
>>>    static int
>>> @@ -1546,14 +1564,14 @@ static int lo_ioctl(struct block_device *bdev, blk_mode_t mode,
>>>    	case LOOP_SET_STATUS:
>>>    		err = -EPERM;
>>>    		if ((mode & BLK_OPEN_WRITE) || capable(CAP_SYS_ADMIN))
>>> -			err = loop_set_status_old(lo, argp);
>>> +			err = loop_set_status_old(lo, mode, bdev, argp);
>>>    		break;
>>>    	case LOOP_GET_STATUS:
>>>    		return loop_get_status_old(lo, argp);
>>>    	case LOOP_SET_STATUS64:
>>>    		err = -EPERM;
>>>    		if ((mode & BLK_OPEN_WRITE) || capable(CAP_SYS_ADMIN))
>>> -			err = loop_set_status64(lo, argp);
>>> +			err = loop_set_status64(lo, mode, bdev, argp);
>>>    		break;
>>>    	case LOOP_GET_STATUS64:
>>>    		return loop_get_status64(lo, argp);
>>> @@ -1647,8 +1665,9 @@ loop_info64_to_compat(const struct loop_info64 *info64,
>>>    }
>>>    static int
>>> -loop_set_status_compat(struct loop_device *lo,
>>> -		       const struct compat_loop_info __user *arg)
>>> +loop_set_status_compat(struct loop_device *lo, blk_mode_t mode,
>>> +		    struct block_device *bdev,
>>> +		    const struct compat_loop_info __user *arg)
>>>    {
>>>    	struct loop_info64 info64;
>>>    	int ret;
>>> @@ -1656,7 +1675,7 @@ loop_set_status_compat(struct loop_device *lo,
>>>    	ret = loop_info64_from_compat(arg, &info64);
>>>    	if (ret < 0)
>>>    		return ret;
>>> -	return loop_set_status(lo, &info64);
>>> +	return loop_set_status(lo, mode, bdev, &info64);
>>>    }
>>>    static int
>>> @@ -1682,7 +1701,7 @@ static int lo_compat_ioctl(struct block_device *bdev, blk_mode_t mode,
>>>    	switch(cmd) {
>>>    	case LOOP_SET_STATUS:
>>> -		err = loop_set_status_compat(lo,
>>> +		err = loop_set_status_compat(lo, mode, bdev,
>>>    			     (const struct compat_loop_info __user *)arg);
>>>    		break;
>>>    	case LOOP_GET_STATUS:
> 
> 

