Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB96C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Aug 2022 09:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE1160C11;
	Wed, 10 Aug 2022 09:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE1160C11
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=EO6t/NXZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6NypbRxHG6x; Wed, 10 Aug 2022 09:54:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1A62360A97;
	Wed, 10 Aug 2022 09:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A62360A97
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8B8BC0033;
	Wed, 10 Aug 2022 09:53:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C905AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 09:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FF54812EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 09:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FF54812EB
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=EO6t/NXZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXZ7n40EtRzY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 09:53:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 137068128C
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 137068128C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 09:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660125207; cv=none; d=zohomail.in; s=zohoarc; 
 b=UblMjqw8qmPYogTQo3ltSXOQI+8glvR4lqIxjVk9CzooC8iZYsOgp40duR8QENbGEW40NR0sowLV5c0W9DYuSO+pu3d7pwwHdzxFPTfI89v9AYHUrDFUdMnRC8CcwgDbx23R9fYrba6Elf/JRCjHWWJZM4wRVr3GyuSe7vf6NqE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660125207;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=jFHeqsb5u9GbFqhnxEh8/I0ZWgirYI4r/VF0zXwQCKg=; 
 b=Y45gDrz/+voF4praet59up2VOlOoGeXzgZ1/SGYannQc77KA7wAOT5YxVU+Rd9OvlifALZMlkuJjFg8WR0bqDqJw9HKYbHPHa8Jq4VO3YAOkhCwawCAQvJ0A01xNcB8NreI18yUGdfHhTve7Q1N9nOy33LKNCXRf3okVMO1i1Mw=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660125207; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=jFHeqsb5u9GbFqhnxEh8/I0ZWgirYI4r/VF0zXwQCKg=;
 b=EO6t/NXZcel9fZsbNJY0cIuSsZPbL5sJaTI4e5p6BpXc38Zv6a95Dr850rfR4QLl
 9ychbWnlk/OBS3tjW9tHDqWJ2XafJTl25LMDMwBDzx4L53TP5wB1et80vPJ9Av8GJmN
 bMXBvyywSJwtqzwGd+4jdvk449o11kXMCIzcUrtg=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1660125195772428.3384944175755;
 Wed, 10 Aug 2022 15:23:15 +0530 (IST)
Date: Wed, 10 Aug 2022 15:23:15 +0530
To: "Piyush Thange" <pthange19@gmail.com>
Message-ID: <182872c2de1.4461d55242061.8862004854197621952@siddh.me>
In-Reply-To: <20220810093508.33790-1-pthange19@gmail.com>
References: <20220810093508.33790-1-pthange19@gmail.com>
Subject: Re: [PATCH] selftests:net:forwarding: Included install command
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: petrm <petrm@nvidia.com>, amcohen <amcohen@nvidia.com>,
 "vladimir.oltean" <vladimir.oltean@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 edumazet <edumazet@google.com>, netdev <netdev@vger.kernel.org>,
 "po-hsu.lin" <po-hsu.lin@canonical.com>,
 linux-kselftest <linux-kselftest@vger.kernel.org>, idosch <idosch@nvidia.com>,
 troglobit <troglobit@gmail.com>, kuba <kuba@kernel.org>,
 pabeni <pabeni@redhat.com>, shuah <shuah@kernel.org>,
 davem <davem@davemloft.net>, tobias <tobias@waldekranz.com>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 10 Aug 2022 15:05:08 +0530  Piyush Thange <pthange19@gmail.com>  wrote:
> If the execution is skipped due to "jq not installed" message then
> the installation methods on different OS's have been provided with
> this message.
> 
> Signed-off-by: Piyush Thange <pthange19@gmail.com>
> ---
>  tools/testing/selftests/net/forwarding/lib.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
> index 37ae49d47853..c4121856fe06 100755
> --- a/tools/testing/selftests/net/forwarding/lib.sh
> +++ b/tools/testing/selftests/net/forwarding/lib.sh
> @@ -152,6 +152,14 @@ require_command()
> 
>  	if [[ ! -x "$(command -v "$cmd")" ]]; then
>  		echo "SKIP: $cmd not installed"
> +		if [[ $cmd == "jq" ]]; then
> +			echo " Install on Debian based systems"
> +			echo "	sudo apt -y install jq"
> +			echo " Install on RHEL based systems"
> +			echo "	sudo yum -y install jq"
> +			echo " Install on Fedora based systems"
> +			echo "	sudo dnf -y install jq"
> +		fi
>  		exit $ksft_skip
>  	fi
>  }
> --
> 2.37.1

This is very specific to `jq` command. What's special with `jq` and not
others? If methods have to be shown, they should be shown for all the
programs which are not installed.

Further, this limits the information to specific package managers and
systems in the userspace. Tomorrow a new system may come, which will
cause this list to grow, not to mention other existing package managers.
The kernel also doesn't have a role in it, so we should try to be generic
as much as possible.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
