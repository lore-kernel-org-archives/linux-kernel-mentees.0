Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AD31DED44
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Feb 2025 20:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739911497; cv=none; b=IM9qo+s0zKyC6zff/Z0VP2NyW9CdZdwoSetJZ4wcKLLwG1YweMlk7ePkVTtAp0N2/prgC4ggcp6TdtvgNW9MBhJnTYSr4Sbo1tZFdBHvAhCoKU+DWB8nsCaDhVnPzdVmVrBxlwz6LflpcrDI5CY9j2a7N7z54lXpt8mMXYDYgzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739911497; c=relaxed/simple;
	bh=/xK1OpD3jYnII80Bbmv3ASuomy+lTutxUhIKv3KZ8vg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VVHtX/HcdNeQhl1usUqzvJBTWn/wMIrgiRyQ/836LvoxLtA00BUCgLhxySUrPFrTv6e0q93gg+4ZTkaBc3cDfpE4Pp/b0ygHMxhVJN2F0kz5Zz9ui5PqnWfL4v1Jcwqpnviqyym0JmWEohHJpQqTvTMwZLNZKSxt2n81bQtqtBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZErjMnHi; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZErjMnHi"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192406075A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Feb 2025 20:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CeFtcuSP4Ie for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2025 20:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=llong@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC312606A7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC312606A7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZErjMnHi
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CC312606A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Feb 2025 20:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739911492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9U6IaL4Uh4Ysg2qyqv6Wdh6gK8ZyE5jqK4/4mRmvBeY=;
	b=ZErjMnHiAnTvN9qwj3lL0GbYjs3MWUEA9/yHF3mEff7emyt4/VHTbLhtpEkTFYZd5bxazG
	2ObWAqzXjDJ2F5+LMsXSfNtDESUgFXO4v/K+RzOtya1Xsy6IBCK3wIT0+ETzgq0+4IOyDI
	glgMOuGazJ2ijV6t1tuaStiS8CP5Wt0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-O5sXMormN_KMOrD6TSnjFw-1; Tue, 18 Feb 2025 15:44:50 -0500
X-MC-Unique: O5sXMormN_KMOrD6TSnjFw-1
X-Mimecast-MFC-AGG-ID: O5sXMormN_KMOrD6TSnjFw_1739911490
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-472001e9fe9so24154341cf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Feb 2025 12:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739911490; x=1740516290;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9U6IaL4Uh4Ysg2qyqv6Wdh6gK8ZyE5jqK4/4mRmvBeY=;
        b=wUgtWFyLGW0lUKLadgwmup/BdtetjOIJbw6VVIfPkav63t+30BUnturagtqaSIaRdn
         0GGOrQKYpmWVXofJtFcX7+kVRlnxjsOZJ37p3O+kQfZ9f763xLpfKSxNfRNETPLrDYNp
         K0cQq/tefZu/vrtz3CVqMZghwux9UOU6P310sSPk4lGvwYNVd0+GH1GxJuYNS4CShbQ3
         2iKqLYt/TxzWwyaFXuORuOur0X2pJJooA/1QMAPZ4WpbsXqrijiV+tFCNUYs/M+FhRX5
         LRroMA/1nhgaD0VnoS+kAqeNlzWmolf8yavjzBrzy6JhV7wRh1ExvmLuUtyTLr5Z0ITl
         i21g==
X-Forwarded-Encrypted: i=1; AJvYcCXHD5xx+BM4ZWE6GbyoFibiFbjXnuGLw6TaVv29XqPmrkqot6fQVHYN5SsPRN2JSAZQkypm46qYCq4EHkmvA7L66n7scQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz/tkJcH987+BiSfmnIqa6hdbApahrE6RUVBClzsgNcb5TUWUYA
	e2w7Aj1phQjYNP3eLyFgrv8PNHWFOojWdoiNvFR6b/G093OPmwSaw3L+G8ZvfTICHMglzAFimuS
	EBwwEkjmHFenUKeuepvdT7X3rQX9VL3KXBalVcr4ShQu2ZN3bnna0MuSKZNWqPtz+B6NHm1UR6y
	Q/z8bFSu8kTQ==
X-Gm-Gg: ASbGncvVen1XLi8nM3/mbQPOKfTyrIHBH7tYFb9654NtSZmamoGBjojNK+ZOl6mP8PE
	xZZwxiGnLRuhrzivxuLpUTGKrGjwGhCDllHIbo2cCYGHNc/YUihwQv8hF2ZeVuJ42oNlqHIJsEz
	RzKayJVNTX16Wyy1vDV+VocB35nuxSWT1/NcZRnQq4bMKYbei5ETfvch7X4SC+wbnK19wkqF8tt
	RNDTzjCLnVXZW4UiRW4yrb6m9X7UqXnmJKEP8/eqyrg7CSM33OqS07RkPJTqcoWb2H7q0/6a4xt
	8vr8blfIvU+mSs0wl1WkO8Q9Wx4e3qPkQo/LrylE4IWt/7+t
X-Received: by 2002:ac8:5e4e:0:b0:471:bd14:a77c with SMTP id d75a77b69052e-472082a97c3mr14807111cf.44.1739911489844;
        Tue, 18 Feb 2025 12:44:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDJ43mCnX/GxrYQz/yZz57l69Gil45oCG1T44SH7mvxCs6L1e9ve5SqgQTdz+WY3G273FDRg==
X-Received: by 2002:ac8:5e4e:0:b0:471:bd14:a77c with SMTP id d75a77b69052e-472082a97c3mr14806821cf.44.1739911489528;
        Tue, 18 Feb 2025 12:44:49 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471fa44e494sm17504291cf.48.2025.02.18.12.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 12:44:49 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <c7fce1b1-b0f7-42b8-9a1f-fd07e6200924@redhat.com>
Date: Tue, 18 Feb 2025 15:44:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: make shell scripts POSIX-compliant
To: Aditya Dutt <duttaditya18@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Tejun Heo <tj@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "David S . Miller" <davem@davemloft.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, cgroups@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250216120225.324468-1-duttaditya18@gmail.com>
In-Reply-To: <20250216120225.324468-1-duttaditya18@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MZI0kz236HIxokPSmMeq5ofcRf33RRa9OnpjsrFjbOk_1739911490
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/25 7:02 AM, Aditya Dutt wrote:
> Changes include:
> - Replaced [[ ... ]] with [ ... ]
> - Replaced == with =
> - Replaced printf -v with cur=$(printf ...).
> - Replaced echo -e with printf "%b\n" ...
>
> The above mentioned are Bash/GNU extensions and are not part of POSIX.
> Using shells like dash or non-GNU coreutils may produce errors.
> They have been replaced with POSIX-compatible alternatives.
>
> Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
> ---
>
> I have made sure to only change the files that specifically have the
> /bin/sh shebang.
> I have referred to https://mywiki.wooledge.org/Bashism for information
> on what is and what isn't POSIX-compliant.
>
>   tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh   | 10 +++++-----
>   tools/testing/selftests/kexec/kexec_common_lib.sh     |  2 +-
>   tools/testing/selftests/kexec/test_kexec_file_load.sh |  2 +-
>   tools/testing/selftests/net/veth.sh                   | 10 +++++-----
>   tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh   |  2 +-
>   tools/testing/selftests/zram/zram_lib.sh              |  2 +-
>   6 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
> index 3f45512fb512..00416248670f 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
> @@ -11,24 +11,24 @@ skip_test() {
>   	exit 4 # ksft_skip
>   }
>   
> -[[ $(id -u) -eq 0 ]] || skip_test "Test must be run as root!"
> +[ $(id -u) -eq 0 ] || skip_test "Test must be run as root!"
>   
>   # Find cpuset v1 mount point
>   CPUSET=$(mount -t cgroup | grep cpuset | head -1 | awk -e '{print $3}')
> -[[ -n "$CPUSET" ]] || skip_test "cpuset v1 mount point not found!"
> +[ -n "$CPUSET" ] || skip_test "cpuset v1 mount point not found!"
>   
>   #
>   # Create a test cpuset, put a CPU and a task there and offline that CPU
>   #
>   TDIR=test$$
> -[[ -d $CPUSET/$TDIR ]] || mkdir $CPUSET/$TDIR
> +[ -d $CPUSET/$TDIR ] || mkdir $CPUSET/$TDIR
>   echo 1 > $CPUSET/$TDIR/cpuset.cpus
>   echo 0 > $CPUSET/$TDIR/cpuset.mems
>   sleep 10&
>   TASK=$!
>   echo $TASK > $CPUSET/$TDIR/tasks
>   NEWCS=$(cat /proc/$TASK/cpuset)
> -[[ $NEWCS != "/$TDIR" ]] && {
> +[ $NEWCS != "/$TDIR" ] && {
>   	echo "Unexpected cpuset $NEWCS, test FAILED!"
>   	exit 1
>   }
> @@ -38,7 +38,7 @@ sleep 0.5
>   echo 1 > /sys/devices/system/cpu/cpu1/online
>   NEWCS=$(cat /proc/$TASK/cpuset)
>   rmdir $CPUSET/$TDIR
> -[[ $NEWCS != "/" ]] && {
> +[ $NEWCS != "/" ] && {
>   	echo "cpuset $NEWCS, test FAILED!"
>   	exit 1
>   }

test_cpuset_v1_hp.sh had been changed to use /bin/bash in v6.14 by 
commit fd079124112c ("selftests/cgroup: use bash in test_cpuset_v1_hp.sh").

Cheers,
Longman

