Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBC2C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 09:06:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B57760527
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 09:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B57760527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5674F4053E;
	Fri, 30 Jul 2021 09:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a20iYA59DYZv; Fri, 30 Jul 2021 09:06:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7F93B4037E;
	Fri, 30 Jul 2021 09:06:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C0A5C0010;
	Fri, 30 Jul 2021 09:06:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B41DDC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E1C840105
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lffYtWhkW3Ke
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:06:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC46B40104
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:06:15 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so13588142pjd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mw1aFNNIOpDd6NtZ8F40EUdFGaW5gJZPJaFX36P2GH4=;
 b=PDhCB3WiEMgvoVoN6RSvr91JVfbkdxrwkvEDMIF9wzT17E0CzubrymEuVPOlE3NOXN
 /8YACLQCPhk56eQzxEZ8WPwnoCBJCMN7Za/s2Qc+zun84neby2kck5aOfEATqEsFOjv4
 bY6gn+7RP2/VJCJ3b/Is1HGQMZz43jUOsLtcr0Rf67qfHpm5xmzm5jruRJriT9QIjK2r
 hr0r31VDMsfbop9DWXSF9lSkxTL5tf8EjGiufZDdbKnWkYA0ezlGEXuYiJD9EQy9iUtX
 n2ATYssATUEy0lzTmo0MTGdFs9u9+Nmsi9AvJGXN+HERe7iaUBpvt46rKMY25YasxSnf
 duKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mw1aFNNIOpDd6NtZ8F40EUdFGaW5gJZPJaFX36P2GH4=;
 b=UxwCPmmvQqkwnIIL1hnhlmfatrAY6teYZA90FMLSz3Zqf9y5TfF5btge37cV/fqkpj
 qo6wxDlEDTE2aJxWuZAEKwzWhFsQY814hYTzSqCjN1mKupbvllYuOAeysJqDJ5gTsWhF
 7P49v/MdBLHXmXTYvFEv8SkUlOb6EdNyoViq7kijlqWIWRQb3RJj0Knpck0Ye+xNZkZV
 FjD80HGO2RtF4TX2yARO93AbhqbvQxYGsWmQdHcQnpDdqYv6xEkSze+lPd5bBnj9IV8E
 1LtSIploBVZWJrXaathjLuBIwk3gPFDFnqG5XDK2T7/uMFr53UWYitHXEAnuxCLPqXXU
 SCfw==
X-Gm-Message-State: AOAM5330cmyn3n0Dq0/EZNTniylY11Wd3SXcBedGTiB2g/ZI4/0O6m0Z
 HQXI3n5x+kvfDBdnLqZH8LupOZsRiTzgvfqBIu0=
X-Google-Smtp-Source: ABdhPJwMP6iBF4QEFfQd4ZEwB71ogfa04DRHUob13iYfVP9XXnAjEIO+neixEejSZo4OBjngk8pIMA==
X-Received: by 2002:a17:903:49:b029:12b:1c88:101b with SMTP id
 l9-20020a1709030049b029012b1c88101bmr1771853pla.30.1627635974881; 
 Fri, 30 Jul 2021 02:06:14 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id a16sm1570122pfo.66.2021.07.30.02.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 02:06:14 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] Bluetooth: fix inconsistent lock state in
 rfcomm_connect_ind
To: Marcel Holtmann <marcel@holtmann.org>
References: <20210721093832.78081-1-desmondcheongzx@gmail.com>
 <20210721093832.78081-3-desmondcheongzx@gmail.com>
 <06E57598-5723-459D-9CE3-4DD8D3145D86@holtmann.org>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <40f38642-faa9-8c63-4306-6477e272cfbe@gmail.com>
Date: Fri, 30 Jul 2021 17:06:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <06E57598-5723-459D-9CE3-4DD8D3145D86@holtmann.org>
Content-Language: en-US
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Stefan Schmidt <stefan@datenfreihafen.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

SGkgTWFyY2VsLAoKT24gMzAvNy8yMSAzOjUzIGFtLCBNYXJjZWwgSG9sdG1hbm4gd3JvdGU6Cj4g
SGkgRGVzbW9uZCwKPiAKPj4gQ29tbWl0IGZhZDAwM2I2YzhlM2QgKCJCbHVldG9vdGg6IEZpeCBp
bmNvbnNpc3RlbnQgbG9jayBzdGF0ZSB3aXRoCj4+IFJGQ09NTSIpIGZpeGVkIGEgbG9ja2RlcCB3
YXJuaW5nIGR1ZSB0byBzay0+c2tfbG9jay5zbG9jayBiZWluZwo+PiBhY3F1aXJlZCB3aXRob3V0
IGRpc2FibGluZyBzb2Z0aXJxIHdoaWxlIHRoZSBsb2NrIGlzIGFsc28gdXNlZCBpbgo+PiBzb2Z0
aXJxIGNvbnRleHQuIFRoaXMgd2FzIGRvbmUgYnkgZGlzYWJsaW5nIGludGVycnVwdHMgYmVmb3Jl
IGNhbGxpbmcKPj4gYmhfbG9ja19zb2NrIGluIHJmY29tbV9za19zdGF0ZV9jaGFuZ2UuCj4+Cj4+
IExhdGVyLCB0aGlzIHdhcyBjaGFuZ2VkIGluIGNvbW1pdCBlNmRhMGVkYzI0ZWUgKCJCbHVldG9v
dGg6IEFjcXVpcmUKPj4gc2tfbG9jay5zbG9jayB3aXRob3V0IGRpc2FibGluZyBpbnRlcnJ1cHRz
IikgdG8gZGlzYWJsZSBzb2Z0aXJxcwo+PiBvbmx5Lgo+Pgo+PiBIb3dldmVyLCB0aGVyZSBpcyBh
bm90aGVyIGluc3RhbmNlIG9mIHNrLT5za19sb2NrLnNsb2NrIGJlaW5nIGFjcXVpcmVkCj4+IHdp
dGhvdXQgZGlzYWJsaW5nIHNvZnRpcnEgaW4gcmZjb21tX2Nvbm5lY3RfaW5kLiBUaGlzIHBhdGNo
IGZpeGVzIHRoaXMKPj4gYnkgZGlzYWJsaW5nIGxvY2FsIGJoIGJlZm9yZSB0aGUgY2FsbCB0byBi
aF9sb2NrX3NvY2suCj4gCj4gYmFjayBpbiB0aGUgZGF5cywgdGhlIHBhY2tldCBwcm9jZXNzaW5n
IHdhcyBkb25lIGluIGEgdGFza2xldCwgYnV0IHRoZXNlIGRheXMgaXQgaXMgZG9uZSBpbiBhIHdv
cmtxdWV1ZS4gU28gc2hvdWxkbuKAmXQgdGhpcyBiZSBqdXN0IGNvbnZlcnRlZCBpbnRvIGEgbG9j
a19zb2NrKCkuIEFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4gCgpUaGFua3MgZm9yIHRoZSBpbmZv
LiBJIHRoaW5rIHlvdSdyZSByaWdodCwgSSBqdXN0IGRpZG4ndCB1bmRlcnN0YW5kIHZlcnkgCm11
Y2ggd2hlbiBJIHdyb3RlIHRoaXMgcGF0Y2guCgpJZiBJJ20gdW5kZXJzdGFuZGluZyBjb3JyZWN0
bHksIGl0IHNlZW1zIHRoYXQgYm90aCB0aGUgYmhfbG9ja19zb2NrIGluIApyZmNvbW1fY29ubmVj
dF9pbmQsIGFuZCBzcGluX2xvY2tfYmggaW4gcmZjb21tX3NrX3N0YXRlX2NoYW5nZSBuZWVkIHRv
IApiZSBjaGFuZ2VkIHRvIGxvY2tfc29jaywgb3RoZXJ3aXNlIHRoZXkgZG9uJ3QgcHJvdmlkZSBh
bnkgCnN5bmNocm9uaXphdGlvbiB3aXRoIG90aGVyIGZ1bmN0aW9ucyBpbiBSRkNPTU0gdGhhdCB1
c2UgbG9ja19zb2NrLgoKSWYgdGhhdCBzb3VuZHMgY29ycmVjdCBJIGNhbiBwcmVwYXJlIHRoZSBw
YXRjaCBmb3IgdGhhdC4KCkJlc3Qgd2lzaGVzLApEZXNtb25kCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
