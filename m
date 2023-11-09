Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net [46.105.58.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A012D294
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Nov 2023 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.138.52])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 5DCC2218C5
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Nov 2023 08:43:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-v4d2x (unknown [10.110.171.163])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3B4F01FE30;
	Thu,  9 Nov 2023 08:43:51 +0000 (UTC)
Received: from RCM-web5.webmail.mail.ovh.net ([51.255.71.60])
	by ghost-submission-6684bf9d7b-v4d2x with ESMTPSA
	id xetbDMebTGXnFgAAqsDEaA
	(envelope-from <jose.pekkarinen@foxhound.fi>); Thu, 09 Nov 2023 08:43:51 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 09 Nov 2023 10:43:50 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, skhan@linuxfoundation.org, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/amd/pm: replace 1-element arrays with flexible-array
 members
In-Reply-To: <2023110835-magnolia-prune-02d0@gregkh>
References: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
 <2023110835-magnolia-prune-02d0@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <1b20f2e4ddc0b0e94aa9a1f9c76ff75c@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.102.8
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11224940598066063041
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddvtddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepheeiudelueefgefgueehgfeukeejgedthedufedvudetfeduveekleefudehjedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudekhedrvddvtddruddtvddrkedphedurddvheehrdejuddriedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth

On 2023-11-08 09:29, Greg KH wrote:
> On Wed, Nov 08, 2023 at 08:54:35AM +0200, José Pekkarinen wrote:
>> The following case seems to be safe to be replaced with a flexible 
>> array
>> to clean up the added coccinelle warning. This patch will just do it.
>> 
>> drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h:76:38-63: 
>> WARNING use flexible-array member instead 
>> (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> ---
>>  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h 
>> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> index c7b61222d258..1ce4087005f0 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> @@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
>> 
>>  struct smu8_ih_meta_data {
>>  	uint32_t command;
>> -	struct smu8_register_index_data_pair register_index_value_pair[1];
>> +	struct smu8_register_index_data_pair register_index_value_pair[];
> 
> Did you just change this structure size without any need to change any
> code as well?  How was this tested?

     I didn't find any use of that struct member, if I missed
something here, please let me know and I'll happily address any
needed further work.

     José.
