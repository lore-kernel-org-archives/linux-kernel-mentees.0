Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5919DF75
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  9 Nov 2024 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731169205; cv=none; b=l3VtJvY7O/MgwsbKcn2Ufuayei4jRrSKNA6ZpWzqU4Wo7l4cOA748z5LuHC7aru++IikQEXZvOop8YTGZlAuG0aWgZqAtmlHWNp3jQwD9o6vks8/SyOOGEOe7jstirP9U69G5QRsC9sYeYYuWHXlhzncl8+G/E7y8rIRlJ+7ui8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731169205; c=relaxed/simple;
	bh=bYM/NzIvyRrfBsP8RmBIZKV4NZLOrYsf/moxsAkmvic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1Cf5CP5RmidFQyJXo5DhfnHmGbwWqQ7lYZgOs+ZuBdfdIp63tJmfyk+woONPhwqCK3n1X/Qi6XimFlOAURYQvVHDZgj2U9owD0MvtK58vZ+ViQgiKPVrLNox8F2y22BHQfk4b7kU93KxzsYqvIeTVsHN7HFYIlJmU3uP+jXV3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aa3JUiz7; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aa3JUiz7"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF65606B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  9 Nov 2024 16:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.25
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1aU2N1qrZg4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Nov 2024 16:20:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5941600B6
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5941600B6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Aa3JUiz7
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B5941600B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  9 Nov 2024 16:20:02 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c9978a221so35791275ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 09 Nov 2024 08:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731169202; x=1731774002; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIdDqkNi3q3KSA3T4NLnanAmEvoPnAc5/iNz3QjbMxk=;
        b=Aa3JUiz7mDVEAUQMZnp6zb/8ulyHZ4dZJYUbKClOlylanHGrKYqgQ09ZIePuYZWYB8
         Q6SQFAQPX6KdGJS4tRZCfhPTZxVg9u/Fn1fkusstIYnDp9Z5LJMG+r5NeDGB6RKHbZ2P
         naRT8gFRbjiuoO7wSc1y8An+DJcH6D00aYrjyuMNmJ9f+A+jKBUqYl95kqHSa8rqTJdO
         BywHrFxL7ZxPYWMVSvnh08YBLAoxwfZTDMFnA7GQCh8PgsJWORprQQtyRz63lqMKZS09
         ZhPWCmTowCEQi8qQeBxXPSK5Or/F2VNEj+amqp+ZfZY/1SKSuApzuurLNeSh5wnjDBU8
         IJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731169202; x=1731774002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIdDqkNi3q3KSA3T4NLnanAmEvoPnAc5/iNz3QjbMxk=;
        b=iShY/ZSmlKqvWd0BmiZ7TubFBsp/iZogD7TlUAKtzXivo4wfY1GlX/Fc5LuTaYYF5Q
         DhwMunMX8HOrxCJ/JTxsEEXSDuEFvqna0ws3B9xfOnRDPvYOliaRy+ISj5U3DP7JxmP6
         5dqD/Ll0mNbJZm7xXQerk6klFUUE6eOIPuIKZI59/5l2W3WNK/gpuwlHtOeyJjDIdseE
         hPDNQ5fSJ72l2/1xVFSurFQQ/2n5/PRQipPQvKDJqhinZFs4OLCdD7pXtPxcYGlV8mrM
         QLYrmurVNAB4ASy+yFtnAKr9URMAntTsrjBA/9i7U4nX9hg8/lXiOKbYV18kdB6WwZYb
         WJIA==
X-Gm-Message-State: AOJu0YzcybqQZOQiodc6sDxxNerMOd78Iw8ESEpiqfvBVpADexGq1ix1
	7t6+mGtMOi/kFup3oFC2AQr3gW20jXAZLWOfERSHewhGg0P2xslT
X-Google-Smtp-Source: AGHT+IHchpijQZ/t4MIM3Z5ZvdChlTY7hqQFZY7Q8ZocwKd7CTk25AFO5k8cr+DqsbXwQBkkfgRHfA==
X-Received: by 2002:a17:902:e5d0:b0:20c:e4c3:27a1 with SMTP id d9443c01a7336-21183c41aa4mr86898525ad.3.1731169201856;
        Sat, 09 Nov 2024 08:20:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e45839sm48009165ad.143.2024.11.09.08.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 08:20:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 Nov 2024 08:19:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: hwmon: Fix typos in sch5627 and max31827
Message-ID: <a8ec5b3a-7adc-42d9-8c67-04f21f000eaf@roeck-us.net>
References: <20241108212201.144482-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108212201.144482-1-xandfury@gmail.com>

On Fri, Nov 08, 2024 at 02:22:01PM -0700, Abhinav Saxena wrote:
> Fix some typos in hwmon/sch5627 and hwmon/max31827 reported by
> checkpatch.pl. These changes are purely documentation cleanup with no
> functional modifications.
> 
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied.

Thanks,
Guenter
