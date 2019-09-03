From: khalid.aziz@oracle.com (Khalid Aziz)
Date: Tue, 3 Sep 2019 13:45:21 -0600
Subject: [Linux-kernel-mentees] [RFC PATCH 0/2] Add predictive memory
	reclamation and compaction
In-Reply-To: <20190902080218.GF14028@dhcp22.suse.cz>
References: <20190813140553.GK17933@dhcp22.suse.cz>
	<3cb0af00-f091-2f3e-d6cc-73a5171e6eda@oracle.com>
	<20190814085831.GS17933@dhcp22.suse.cz>
	<d3895804-7340-a7ae-d611-62913303e9c5@oracle.com>
	<20190815170215.GQ9477@dhcp22.suse.cz>
	<2668ad2e-ee52-8c88-22c0-1952243af5a1@oracle.com>
	<20190821140632.GI3111@dhcp22.suse.cz>
	<20190826204420.GA16800@bharath12345-Inspiron-5559>
	<20190827061606.GN7538@dhcp22.suse.cz>
	<23eca880-d0d7-00f9-cb1b-b2998f2a1dff@oracle.com>
	<20190902080218.GF14028@dhcp22.suse.cz>
Message-ID: <017a11b1-4115-bdf6-6ebe-e121dd03b386@oracle.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190903194521.isX334X-WqHnUdQdazdwpeSoSIPQ7PhJVdCI0Dx8kJw@z>

On 9/2/19 2:02 AM, Michal Hocko wrote:
> On Fri 30-08-19 15:35:06, Khalid Aziz wrote:
> [...]
>> - Kernel is not self-tuning and is dependent upon a userspace tool to
>> perform well in a fundamental area of memory management.
> 
> You keep bringing this up without an actual analysis of a wider range of
> workloads that would prove that the default behavior is really
> suboptimal. You are making some assumptions based on a very specific DB
> workload which might benefit from a more aggressive background workload.
> If you really want to sell any changes to auto tuning then you really
> need to come up with more workloads and an actual theory why an early
> and more aggressive reclaim pays off.
> 

Hi Michal,

Fair enough. I have seen DB and cloud server workloads suffer under
default behavior of reclaim/compaction. It manifests itself as prolonged
delays in populating new database and in launching new cloud
applications. It is fair to ask for the predictive algorithm to be
proven before pulling something like this in kernel. I will implement
this same algorithm in userspace and use existing knobs to tune kernel
dynamically. Running that with large number of workloads will provide
data on how often does this help. If I find any useful tunables missing,
I will be sure to bring it up.

Thanks,
Khalid
