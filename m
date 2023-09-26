Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B25E7E62F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Sep 2023 12:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628FD614AC;
	Tue, 26 Sep 2023 12:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 628FD614AC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H9HKrdfk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceQNvsXvVkJ7; Tue, 26 Sep 2023 12:18:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1847F614AD;
	Tue, 26 Sep 2023 12:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1847F614AD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E43B5C0039;
	Tue, 26 Sep 2023 12:18:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 425DCC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 12:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18E32405FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 12:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E32405FA
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=H9HKrdfk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vkg2g4Go9cay
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 12:18:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D3C54023B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Sep 2023 12:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3C54023B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695730699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFOa8v6HmzDuwfUtqIaAE2BKKG96nSYmL5UwcSOkLOQ=;
 b=H9HKrdfkH2QRFok+TPU5aAgsqVZdf9S72KwQJpSVDTo8YwkMFwWX/UlzgXXACdfl19GOLi
 6eWR39DgqBXbLcG0Hn+93B6bDWwI4XKz0O6EIsoL4rucZf7F7Vmn7FTdRoFHBtwGz0xU9r
 4gedOD5nWms4ubbeMW+DZecIF1tggng=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-sYah3oPLMR63Rnk3t4ymVg-1; Tue, 26 Sep 2023 08:18:18 -0400
X-MC-Unique: sYah3oPLMR63Rnk3t4ymVg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBA521C06356;
 Tue, 26 Sep 2023 12:18:17 +0000 (UTC)
Received: from [10.22.16.230] (unknown [10.22.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5442F492C37;
 Tue, 26 Sep 2023 12:18:17 +0000 (UTC)
Message-ID: <ed2993f2-4bdc-19c5-5a0f-1e96da44fb24@redhat.com>
Date: Tue, 26 Sep 2023 08:18:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] selftests/cgroup: Fix awk usage in test_cpuset_prs.sh
 that may cause error
Content-Language: en-US
To: Juntong Deng <juntong.deng@outlook.com>, lizefan.x@bytedance.com,
 tj@kernel.org, hannes@cmpxchg.org, shuah@kernel.org
References: <VI1P193MB07522BFC89B6B6DC5A89153999FCA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <VI1P193MB07522BFC89B6B6DC5A89153999FCA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Cc: cgroups@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 9/25/23 15:38, Juntong Deng wrote:
> According to the awk manual, the -e option does not need to be specified
> in front of 'program' (unless you need to mix program-file).
>
> The redundant -e option can cause error when users use awk tools other
> than gawk (for example, mawk does not support the -e option).
>
> Error Example:
> awk: not an option: -e
> Cgroup v2 mount point not found!
>
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> ---
>   tools/testing/selftests/cgroup/test_cpuset_prs.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index 4afb132e4e4f..6820653e8432 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -20,7 +20,7 @@ skip_test() {
>   WAIT_INOTIFY=$(cd $(dirname $0); pwd)/wait_inotify
>   
>   # Find cgroup v2 mount point
> -CGROUP2=$(mount -t cgroup2 | head -1 | awk -e '{print $3}')
> +CGROUP2=$(mount -t cgroup2 | head -1 | awk '{print $3}')
>   [[ -n "$CGROUP2" ]] || skip_test "Cgroup v2 mount point not found!"
>   
>   CPUS=$(lscpu | grep "^CPU(s):" | sed -e "s/.*:[[:space:]]*//")

Yes, the -e option is redundant. Thanks for catching that.

Acked-by: Waiman Long <longman@redhat.com>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
