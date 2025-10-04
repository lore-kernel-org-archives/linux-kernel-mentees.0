Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D17720F08D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759552413; cv=none; b=PbqFyN0o8rHpqIx7P34fAH6hA7MUn5s82ycUxYOI/+lWx0roQDAcmNsDtBQwhEh4SyiYqbcWlw83HvvEnpN9L9HOcq+0QOiaG50i/YJv1KKz7cz0H/co2d9YzMCH7hsEWFFjzycWXuVUSuWCFMX2oShBDVCDOAw0PH8+qAUHkwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759552413; c=relaxed/simple;
	bh=Df+P6JYS2QqpJ3w//ROe66heiGBWOhpaPg4cAlSuCkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkF6VNyf/g8XGjMh6jtRd7r8DgCdWGvo9MJw9zEE1t5dST/yGZA9XrcUZD0TtY3PZQpWl5QNN3CVpQrXVjKVMLpz2UiNbfqz3Td8/LYw5g3fNOIg0Q26ioFoXwNOq9UDVwHXhcLOEKFMJ1e5ftK7zdNVyfeLgLz2wUNfM0FXuQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWK36Xtr; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWK36Xtr"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 031BA61491
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRosQQK31Drj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Oct 2025 04:33:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 518A361464
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 518A361464
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EWK36Xtr
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 518A361464
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:33:31 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7811fa91774so2420881b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759552410; x=1760157210; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrHxtAEC7jf6mOF6GS8lZ4qi3Xoaj0BUwdJ6rxR1K5s=;
        b=EWK36XtrMfS98tHVWq4tr1EO4LVsB6X08HUyx8ENp3fE/Axq6gPfDPgok/ajKS0eSl
         VEHSgM7mJoIM7v77UztpfyMgb3Z1eGfzzr70OBDZVCbBzJ/pxeBMeYP8RNzrVmS/i6uK
         S+3+TrrV87cUJtf86nahW+rRBIiiylo/inPZQ6ronPbbWfEwdQ989+XqX5V6htUgudea
         9O7kLhnKKnya9/HTZgjF+42N2EqxTgudP6pq9s6igldB6ncznDKdEHWUUGEPELD6FUta
         DtprNA2GC90HQ2v65yASex6qnreLrAXZCKFOKCKhrFFH+DfdiQYDCwOapamU3U8qqVU9
         x40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759552410; x=1760157210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrHxtAEC7jf6mOF6GS8lZ4qi3Xoaj0BUwdJ6rxR1K5s=;
        b=bnXTkA+Xeyhc7qVz/KxkHYLqJ6i+dG7IDkpPqSoOF7CYLOOHTR6+ci/s2lSk5acdaE
         2rbZRnM7XsmWaxmjQSFhQGX7Pz4z7z2HCIRqBe7Ho+EEmKOnrPeloP5SEs9OBzrwgUAh
         Y6Slb5JqlsD4Ci05QATe/4Oiznn4FiOgini2XyDmxkoZtp/k+9PVzvSA0WLfgePEHDsu
         GGvL8UwMkU8X4wnyfZ0xiXOuYZa/2XKkk6zij7sUoXTgMQdZYUGsM5CwnnI6DIriQIXf
         21nTndY0nLsLVLzIlXLnpz9th0LvpRM3JMhrv8g4M29j9pexFQYRJEVnDQW0z9z3KrcG
         je+w==
X-Forwarded-Encrypted: i=1; AJvYcCVwRv6SeR55uWOM4WQy5fdrHbWte1GqK7HJkWk/o5VvDCF/khWcKDudwpNIEWFOupo95Izo6UOpmgUkP1p+P8jux8RXbw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwsDDL3K4Nv/X3tMkSVH+BkcQx2LWRbvrQYsCATz/S9hQQhadui
	VYdojk3zMWL+uRvjUkJHpbmszqIqgKoxLNpcYpOloGPpmcPBXjzZ//GD
X-Gm-Gg: ASbGncsUxnNJud6lGJ6rjvgPO8rVLRCVDu+AhLVFnG9fXgczyWDU+AWhAqAPjXGIUGO
	WLiMqTmsF5oAWQ72GP2tTwl1EdOsXQW8/HAHkb9EeSz8r2AgGKz1BjmUrH6DNwiMRX5npGp0+xZ
	JMmPmjliVWLSc7JMWT518/NtUOIPwEBgP05uduicl72ipigNSElxlvJWmVBLXrwK0oV17K5M7r1
	HjdGyxuUratKmo+5C5hbYE4FhutXBkb7miI7hP8dToLnFkawAq3dbkB7eWxlrJ605AEzUcvQVO3
	AC62Lp7D4e2CoOeifnAFUu6sptgn94up689VxFyAS/8V65+gsvRM5B0089N7RpeX4rcZ77ovadC
	w3EC6RFlU8KMG/D23+tc8Sblpv6oZI2KRiCFQsP4HxnAUlkeCFf8dRjZeH4QNTHqm42GhwsA=
X-Google-Smtp-Source: AGHT+IGNRTvBKcRxRWDiko/GbUAC7KjssTgPw+LYSnL0AkNM1865qmWf8lHSyAxiS9XfPYucFzzf3w==
X-Received: by 2002:a05:6a20:7291:b0:251:a106:d96c with SMTP id adf61e73a8af0-32b61dff63fmr7315477637.10.1759552410455;
        Fri, 03 Oct 2025 21:33:30 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.90.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099add13esm6086455a12.8.2025.10.03.21.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 21:33:30 -0700 (PDT)
Message-ID: <a87756f6-b578-421e-b04b-b1dd15f3a2f1@gmail.com>
Date: Sat, 4 Oct 2025 10:03:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: doc: Fix typos
To: Carlos Maiolino <cem@kernel.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-bcachefs@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, netfs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <DrG_H24-pk-ha8vkOEHoZYVXyMFA60c_g4l7cZX4Z7lnKQIM4FjdI_qS-UIpFxa-t7T_JDAOSqKjew7M0wmYYw==@protonmail.internalid>
 <20251001083931.44528-1-bhanuseshukumar@gmail.com>
 <kp4tzf7hvtorldoktxelrvway6w4v4idmu5q3egeaacs7eg2tz@dovkk323ir3b>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <kp4tzf7hvtorldoktxelrvway6w4v4idmu5q3egeaacs7eg2tz@dovkk323ir3b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/25 17:32, Carlos Maiolino wrote:
> On Wed, Oct 01, 2025 at 02:09:31PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> Fix typos in doc comments
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> 
> Perhaps would be better to split this into subsystem-specific patches?
> 
> This probably needs to be re-sent anyway as bcachefs was removed from
> mainline.
> 
> 
>> ---
>>  Note: No change in functionality intended.
>>
>>  Documentation/filesystems/bcachefs/future/idle_work.rst  | 6 +++---
>>  Documentation/filesystems/xfs/xfs-online-fsck-design.rst | 2 +-
>>  fs/netfs/buffered_read.c                                 | 2 +-
>>  fs/xfs/xfs_linux.h                                       | 2 +-
>>  include/linux/fs.h                                       | 4 ++--
>>  5 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/filesystems/bcachefs/future/idle_work.rst b/Documentation/filesystems/bcachefs/future/idle_work.rst
>> index 59a332509dcd..f1202113dde0 100644
>> --- a/Documentation/filesystems/bcachefs/future/idle_work.rst
>> +++ b/Documentation/filesystems/bcachefs/future/idle_work.rst
>> @@ -11,10 +11,10 @@ idle" so the system can go to sleep. We don't want to be dribbling out
>>  background work while the system should be idle.
>>
>>  The complicating factor is that there are a number of background tasks, which
>> -form a heirarchy (or a digraph, depending on how you divide it up) - one
>> +form a hierarchy (or a digraph, depending on how you divide it up) - one
>>  background task may generate work for another.
>>
>> -Thus proper idle detection needs to model this heirarchy.
>> +Thus proper idle detection needs to model this hierarchy.
>>
>>  - Foreground writes
>>  - Page cache writeback
>> @@ -51,7 +51,7 @@ IDLE REGIME
>>  When the system becomes idle, we should start flushing our pending work
>>  quicker so the system can go to sleep.
>>
>> -Note that the definition of "idle" depends on where in the heirarchy a task
>> +Note that the definition of "idle" depends on where in the hierarchy a task
>>  is - a task should start flushing work more quickly when the task above it has
>>  stopped generating new work.
>>
>> diff --git a/Documentation/filesystems/xfs/xfs-online-fsck-design.rst b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
>> index e231d127cd40..e872d480691b 100644
>> --- a/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
>> +++ b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
>> @@ -4179,7 +4179,7 @@ When the exchange is initiated, the sequence of operations is as follows:
>>     This will be discussed in more detail in subsequent sections.
>>
>>  If the filesystem goes down in the middle of an operation, log recovery will
>> -find the most recent unfinished maping exchange log intent item and restart
>> +find the most recent unfinished mapping exchange log intent item and restart
>>  from there.
>>  This is how atomic file mapping exchanges guarantees that an outside observer
>>  will either see the old broken structure or the new one, and never a mismash of
>> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
>> index 37ab6f28b5ad..c81be6390309 100644
>> --- a/fs/netfs/buffered_read.c
>> +++ b/fs/netfs/buffered_read.c
>> @@ -329,7 +329,7 @@ static void netfs_read_to_pagecache(struct netfs_io_request *rreq,
>>   * the netfs if not.  Space beyond the EOF is zero-filled.  Multiple I/O
>>   * requests from different sources will get munged together.  If necessary, the
>>   * readahead window can be expanded in either direction to a more convenient
>> - * alighment for RPC efficiency or to make storage in the cache feasible.
>> + * alignment for RPC efficiency or to make storage in the cache feasible.
>>   *
>>   * The calling netfs must initialise a netfs context contiguous to the vfs
>>   * inode before calling this.
>> diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
>> index 9a2221b4aa21..fdf3cd8c4d19 100644
>> --- a/fs/xfs/xfs_linux.h
>> +++ b/fs/xfs/xfs_linux.h
>> @@ -145,7 +145,7 @@ static inline void delay(long ticks)
>>  /*
>>   * XFS wrapper structure for sysfs support. It depends on external data
>>   * structures and is embedded in various internal data structures to implement
>> - * the XFS sysfs object heirarchy. Define it here for broad access throughout
>> + * the XFS sysfs object hierarchy. Define it here for broad access throughout
>>   * the codebase.
>>   */
>>  struct xfs_kobj {
>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>> index 601d036a6c78..72e82a4a0bbc 100644
>> --- a/include/linux/fs.h
>> +++ b/include/linux/fs.h
>> @@ -1040,7 +1040,7 @@ struct fown_struct {
>>   * struct file_ra_state - Track a file's readahead state.
>>   * @start: Where the most recent readahead started.
>>   * @size: Number of pages read in the most recent readahead.
>> - * @async_size: Numer of pages that were/are not needed immediately
>> + * @async_size: Number of pages that were/are not needed immediately
>>   *      and so were/are genuinely "ahead".  Start next readahead when
>>   *      the first of these pages is accessed.
>>   * @ra_pages: Maximum size of a readahead request, copied from the bdi.
>> @@ -3149,7 +3149,7 @@ static inline void kiocb_start_write(struct kiocb *iocb)
>>
>>  /**
>>   * kiocb_end_write - drop write access to a superblock after async file io
>> - * @iocb: the io context we sumbitted the write with
>> + * @iocb: the io context we submitted the write with
>>   *
>>   * Should be matched with a call to kiocb_start_write().
>>   */
>> --
>> 2.34.1
>>
Hi,

Thanks for pointing out the fact that the bcachefs is now externally maintained.

I will exclude it in my future versions and will split the patch in to subsystem specific.

Regards,
Bhanu Seshu Kumar Valluri
