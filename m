Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DA26E6F3
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 02:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053398; cv=none; b=X4r49NN1ET0Mw8k9KJoGP9KfxtxPIq7iQgoxmejeFGqXO7rbXGvDrwHQsaG0m0ADgIrZCVF6pXpu6OgAcDoyfNo+cBXtM5Nc0ULIQ4yjesox3dB226ZLYeiExVkDqp+utc1u+YvJ52x4e/OmaQxzUXYxPayQpYjW/XqEuEkToow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053398; c=relaxed/simple;
	bh=ltKqSBZXfwtqcj+oKam9eDueOe346roobe+OsgG6koo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyL+J/Zeed6e55QPQtdtI3HoUBuAwGnVZY5FbLFJ+S5MsWh/qZYrJpxdwYRDQDourNvwSNqyLCkTaL+AvIE4N+Y8ucR5HLSmB7j0Pi9ln2sewI+7eVS8DAKuxB+fpq7YnLnNiQoJWlfmoo0s78K+AThi0grKyLHKw406T2iOmLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXwmMHGS; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXwmMHGS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31eb75f4ce1so5432329a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 19:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755053396; x=1755658196; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQS8nEhwcYVup+sy9iJFHAcWvpA/jZF+5gx1aBAFcyc=;
        b=iXwmMHGSlmsLv+UCc5Z4rB1SMmaJ2eOh8Zl/wjS5SomvYMIbBQiOnda7PHC5hDVEab
         J8F67j3k9gY9+if70ICtQwlx59BGb5tdLmz7YsoXkfBjiMJl34xbJqCP+fImXpVI/HAQ
         bDrhUtgi4/aiAVlJ6QSPkIWWWP9UacNSQ+gWunRogzf2Ppli4dZYYyfqFq+i35vGvPUb
         TobQUDyC4kpsZAR/jDMTEEcpLwVz4spAEC7L983udhmbotEzeCsWhUUedJSMylI8bVHU
         LqMAWoNUUGzyqqYcZYSs/FT7lUVZNQyHpGjtWhzvIz1R+K8KYM+wXw7draVoQfa5ma3h
         bN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053396; x=1755658196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQS8nEhwcYVup+sy9iJFHAcWvpA/jZF+5gx1aBAFcyc=;
        b=Y8ezAxobwC3WuhsepLHZetJ6PE5WM0/hpuIAoXqal9Y76qs67jjo2xq8MSYuHWWizw
         D///FiU2QNWZqYWZ9Hw9QySqz8lUtZWiavCbO45RtMGfMnOxxEtM7ssP8v7KVQ4Q1QBx
         +5DlKVNsPSVvfgQji5asID00eO7f++yzeBD7ft/f2s32+yfYqPqq6aZjV9+16ZHE50hi
         oVCPBzJb5WbJCd3r5Lz28J1/JLUi7j94MAk8hZT3MX0OydJsEfoW5Pt6teaZKNPY/diz
         Mv4R934xC3DQboJt+ZVYxcl+nwsEbTdIeWXi5pxu6A/Eee9fzE3Te/Zlhqb0KAQ3YAhM
         cYyw==
X-Forwarded-Encrypted: i=1; AJvYcCXRYcd+hQ2HEILcVvvP4Twf3AWLaPMBe0IK0QEka6KLZiPtXL4VfJQUAzApBjqXqJX6/KYyJGvvBEI85qQHPrU6nD/3vA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjBQNTp1+HUUzK4ZhT2Aj37+02tjvB+Bz6X5AScoc26qctAbgJ
	KYeqzAH8oVwRcl6SwsHjwNpQJF9anfwjN5CEd60ukUojv+/r60Uhm3ti
X-Gm-Gg: ASbGncs22xlrubszIi3hdSBAfsODsjggo1l5eYekTmjMLKBkapknYPWZhEQEZFdnfvJ
	RTDjGzEOk9+pnJmdd6HRc6JoTqgdfdxVuK7EkrXTVboAd+uN6oATLzS298iVOSDyrpIhaWKDB7c
	IHldCY0X02e2bPKK9ZVGxplUgqSizXRehAGrjTad0f2zn6/JplzMAtXTKYvTjCQGRG7wCmi9N80
	Qr+qOsDfBTtOwNjWjHkiCHIJQS8IuCGtz1sszZJoCo0WBEIJOK1RdZzdMhq3qx2UBdwlA3NXhF6
	7Zgf4rJLfgsMIsqBNDIkXjZWFn4pfADF11EjLcEhJ6Cxy3AdOdnlwyt4pQDEBrnisfaDEtRpbzj
	bCnzAxJZ/iYor2QPEHQ+sZC6gBPgxMu5fseNnnjfwU80X1ji3FWm/YK4YmAAzLXu2RuID
X-Google-Smtp-Source: AGHT+IFhTsVjvaAkfVJ663GzAql5Yv8cxjFsr6hoRD84O4VIwAig7x7xsHG/KN3bVF51/jYDe2q7ew==
X-Received: by 2002:a17:90b:4cc9:b0:316:e77:e2cf with SMTP id 98e67ed59e1d1-321d0ed0f13mr1991457a91.35.1755053396217;
        Tue, 12 Aug 2025 19:49:56 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1d981b2sm557590a91.14.2025.08.12.19.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 19:49:55 -0700 (PDT)
Message-ID: <9c4a655e-095b-45fe-b35d-c3f0ae6a9237@gmail.com>
Date: Wed, 13 Aug 2025 11:49:50 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL for v6.17-rc2] add a generic yaml parser integrated
 with Netlink specs generation
To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: EDAC Mailing List <linux-edac@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Ignacio Encinas Rubio <ignacio@iencinas.com>, Marco Elver
 <elver@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jan Stancek <jstancek@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 Ruben Wauters <rubenru09@aol.com>, linux-kernel-mentees@lists.linux.dev,
 netdev@vger.kernel.org, Breno Leitao <leitao@debian.org>,
 Randy Dunlap <rdunlap@infradead.org>, Simon Horman <horms@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <20250812113329.356c93c2@foz.lan> <87h5ycfl3s.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87h5ycfl3s.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[-CC: LKMM folks and list; this has nothing to do with the memory model]

Hi Jon,

On Tue, 12 Aug 2025 12:31:03 -0600, Jonathan Corbet wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
>> Hi Jon/Jakub,
>>
>> In case you both prefer to merge from a stable tag, please pull from:
>>
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-docs.git docs/v6.17-1
>>
>> For:
>>
>> - An YAML parser Sphinx plugin, integrated with Netlink YAML doc
>>   parser.
> 
> OK, I have done that.  I will note that it adds a warning:
> 
>> Documentation/networking/netlink_spec/index.rst: WARNING: document isn't included in any toctree
> 
> ...it might be nice to get that straightened out.

After the merge, "git status" complains:

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
	Documentation/networking/netlink_spec/

So, I don't think there is anything you can do in the Git repo side ...

We need to remember to "rm -rf" the directory after crossing this merge
point.

In theory, such "rm -rf" could be added somewhere in Documentation/Makefile,
but that would not work well with write-protected shared kernel repos.

        Thanks, Akira

